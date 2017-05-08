#該程式未解開Section, 採用最新樣板產出!
{<section id="astt602.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0014(2014-12-30 13:13:38), PR版次:0014(2016-11-21 11:45:59)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000275
#+ Filename...: astt602
#+ Description: 經銷商合作進埸協議申請作業
#+ Creator....: 02003(2014-06-16 09:42:03)
#+ Modifier...: 06137 -SD/PR- 02749
 
{</section>}
 
{<section id="astt602.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#151125-00001#4     2015/11/25  By 06948    增加作廢時詢問「是否作廢」
#160318-00025#46    2016/04/28  By 07959    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160818-00017#40    2016/08/23  By 08734    删除修改未重新判断状态码
#160905-00007#17    2016/09/05  By 08734    ent调整
#160824-00007#195   2016/11/20  by lori     修正舊值備份寫法
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
PRIVATE type type_g_stcm_m        RECORD
       stcmsite LIKE stcm_t.stcmsite, 
   stcmsite_desc LIKE type_t.chr80, 
   stcmdocdt LIKE stcm_t.stcmdocdt, 
   stcmdocno LIKE stcm_t.stcmdocno, 
   stcmunit LIKE stcm_t.stcmunit, 
   stcm001 LIKE stcm_t.stcm001, 
   stcm003 LIKE stcm_t.stcm003, 
   stcm003_desc LIKE type_t.chr80, 
   stcm004 LIKE stcm_t.stcm004, 
   stcm004_desc LIKE type_t.chr80, 
   stcm002 LIKE stcm_t.stcm002, 
   stcm005 LIKE stcm_t.stcm005, 
   stcm006 LIKE stcm_t.stcm006, 
   stcm006_desc LIKE type_t.chr80, 
   stcm007 LIKE stcm_t.stcm007, 
   stcm007_desc LIKE type_t.chr80, 
   stcmstus LIKE stcm_t.stcmstus, 
   stcm008 LIKE stcm_t.stcm008, 
   stcm008_desc LIKE type_t.chr80, 
   stcm009 LIKE stcm_t.stcm009, 
   stcm009_desc LIKE type_t.chr80, 
   stcm016 LIKE stcm_t.stcm016, 
   stcm016_desc LIKE type_t.chr80, 
   stcm017 LIKE stcm_t.stcm017, 
   stcm017_desc LIKE type_t.chr80, 
   next_b LIKE type_t.chr500, 
   stcm010 LIKE stcm_t.stcm010, 
   stcm010_desc LIKE type_t.chr80, 
   stcm011 LIKE stcm_t.stcm011, 
   stcm011_desc LIKE type_t.chr80, 
   stcm012 LIKE stcm_t.stcm012, 
   stcm012_desc LIKE type_t.chr80, 
   stcm018 LIKE stcm_t.stcm018, 
   num LIKE type_t.chr500, 
   stcm013 LIKE stcm_t.stcm013, 
   stcm013_desc LIKE type_t.chr80, 
   stcm014 LIKE stcm_t.stcm014, 
   stcm014_desc LIKE type_t.chr80, 
   stcm015 LIKE stcm_t.stcm015, 
   stcm015_desc LIKE type_t.chr80, 
   stcm019 LIKE stcm_t.stcm019, 
   stcmownid LIKE stcm_t.stcmownid, 
   stcmownid_desc LIKE type_t.chr80, 
   stcmowndp LIKE stcm_t.stcmowndp, 
   stcmowndp_desc LIKE type_t.chr80, 
   stcmcrtid LIKE stcm_t.stcmcrtid, 
   stcmcrtid_desc LIKE type_t.chr80, 
   stcmcrtdp LIKE stcm_t.stcmcrtdp, 
   stcmcrtdp_desc LIKE type_t.chr80, 
   stcmcrtdt LIKE stcm_t.stcmcrtdt, 
   stcmmodid LIKE stcm_t.stcmmodid, 
   stcmmodid_desc LIKE type_t.chr80, 
   stcmmoddt LIKE stcm_t.stcmmoddt, 
   stcmcnfid LIKE stcm_t.stcmcnfid, 
   stcmcnfid_desc LIKE type_t.chr80, 
   stcmcnfdt LIKE stcm_t.stcmcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stcn_d        RECORD
       stcnseq LIKE stcn_t.stcnseq, 
   stcn001 LIKE stcn_t.stcn001, 
   stcn001_desc LIKE type_t.chr500, 
   stcn002 LIKE stcn_t.stcn002, 
   stcn003 LIKE stcn_t.stcn003, 
   stcn004 LIKE stcn_t.stcn004, 
   stcn005 LIKE stcn_t.stcn005, 
   stcn006 LIKE stcn_t.stcn006, 
   stcn007 LIKE stcn_t.stcn007, 
   stcn008 LIKE stcn_t.stcn008, 
   stcn009 LIKE stcn_t.stcn009, 
   stcn010 LIKE stcn_t.stcn010, 
   stcn011 LIKE stcn_t.stcn011, 
   stcn012 LIKE stcn_t.stcn012, 
   stcn013 LIKE stcn_t.stcn013, 
   stcn014 LIKE stcn_t.stcn014, 
   stcn015 LIKE stcn_t.stcn015, 
   stcn016 LIKE stcn_t.stcn016, 
   stcn017 LIKE stcn_t.stcn017, 
   stcn018 LIKE stcn_t.stcn018, 
   stcn019 LIKE stcn_t.stcn019, 
   stcnsite LIKE stcn_t.stcnsite, 
   stcnunit LIKE stcn_t.stcnunit
       END RECORD
PRIVATE TYPE type_g_stcn2_d RECORD
       stcoseq LIKE stco_t.stcoseq, 
   stco001 LIKE stco_t.stco001, 
   stco001_desc LIKE type_t.chr500, 
   stco001_desc_desc LIKE type_t.chr500, 
   stco002 LIKE stco_t.stco002, 
   stcosite LIKE stco_t.stcosite, 
   stcounit LIKE stco_t.stcounit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stcmdocno LIKE stcm_t.stcmdocno,
      b_stcmdocdt LIKE stcm_t.stcmdocdt,
      b_stcmsite LIKE stcm_t.stcmsite,
   b_stcmsite_desc LIKE type_t.chr80,
      b_stcm001 LIKE stcm_t.stcm001,
      b_stcm003 LIKE stcm_t.stcm003,
   b_stcm003_desc LIKE type_t.chr80,
      b_stcm004 LIKE stcm_t.stcm004,
   b_stcm004_desc LIKE type_t.chr80,
      b_stcm005 LIKE stcm_t.stcm005,
      b_stcm006 LIKE stcm_t.stcm006,
   b_stcm006_desc LIKE type_t.chr80,
      b_stcm007 LIKE stcm_t.stcm007,
   b_stcm007_desc LIKE type_t.chr80,
      b_stcm008 LIKE stcm_t.stcm008,
   b_stcm008_desc LIKE type_t.chr80,
      b_stcm009 LIKE stcm_t.stcm009,
   b_stcm009_desc LIKE type_t.chr80,
      b_stcm010 LIKE stcm_t.stcm010,
   b_stcm010_desc LIKE type_t.chr80,
      b_stcm011 LIKE stcm_t.stcm011,
   b_stcm011_desc LIKE type_t.chr80,
      b_stcm012 LIKE stcm_t.stcm012,
   b_stcm012_desc LIKE type_t.chr80,
      b_stcm013 LIKE stcm_t.stcm013,
   b_stcm013_desc LIKE type_t.chr80,
      b_stcm014 LIKE stcm_t.stcm014,
   b_stcm014_desc LIKE type_t.chr80,
      b_stcm015 LIKE stcm_t.stcm015,
   b_stcm015_desc LIKE type_t.chr80,
      b_stcm016 LIKE stcm_t.stcm016,
   b_stcm016_desc LIKE type_t.chr80,
      b_stcm017 LIKE stcm_t.stcm017,
   b_oodbl004 LIKE type_t.chr80,
      b_stcm018 LIKE stcm_t.stcm018,
      b_stcm019 LIKE stcm_t.stcm019,
      b_stcmunit LIKE stcm_t.stcmunit
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
       
#模組變數(Module Variables)
DEFINE g_stcm_m          type_g_stcm_m
DEFINE g_stcm_m_t        type_g_stcm_m
DEFINE g_stcm_m_o        type_g_stcm_m
DEFINE g_stcm_m_mask_o   type_g_stcm_m #轉換遮罩前資料
DEFINE g_stcm_m_mask_n   type_g_stcm_m #轉換遮罩後資料
 
   DEFINE g_stcmdocno_t LIKE stcm_t.stcmdocno
 
 
DEFINE g_stcn_d          DYNAMIC ARRAY OF type_g_stcn_d
DEFINE g_stcn_d_t        type_g_stcn_d
DEFINE g_stcn_d_o        type_g_stcn_d
DEFINE g_stcn_d_mask_o   DYNAMIC ARRAY OF type_g_stcn_d #轉換遮罩前資料
DEFINE g_stcn_d_mask_n   DYNAMIC ARRAY OF type_g_stcn_d #轉換遮罩後資料
DEFINE g_stcn2_d          DYNAMIC ARRAY OF type_g_stcn2_d
DEFINE g_stcn2_d_t        type_g_stcn2_d
DEFINE g_stcn2_d_o        type_g_stcn2_d
DEFINE g_stcn2_d_mask_o   DYNAMIC ARRAY OF type_g_stcn2_d #轉換遮罩前資料
DEFINE g_stcn2_d_mask_n   DYNAMIC ARRAY OF type_g_stcn2_d #轉換遮罩後資料
 
 
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
DEFINE g_site_flag       LIKE type_t.num5  #ken
#end add-point
 
{</section>}
 
{<section id="astt602.main" >}
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
   LET g_forupd_sql = " SELECT stcmsite,'',stcmdocdt,stcmdocno,stcmunit,stcm001,stcm003,'',stcm004,'', 
       stcm002,stcm005,stcm006,'',stcm007,'',stcmstus,stcm008,'',stcm009,'',stcm016,'',stcm017,'','', 
       stcm010,'',stcm011,'',stcm012,'',stcm018,'',stcm013,'',stcm014,'',stcm015,'',stcm019,stcmownid, 
       '',stcmowndp,'',stcmcrtid,'',stcmcrtdp,'',stcmcrtdt,stcmmodid,'',stcmmoddt,stcmcnfid,'',stcmcnfdt", 
        
                      " FROM stcm_t",
                      " WHERE stcment= ? AND stcmdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt602_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stcmsite,t0.stcmdocdt,t0.stcmdocno,t0.stcmunit,t0.stcm001,t0.stcm003, 
       t0.stcm004,t0.stcm002,t0.stcm005,t0.stcm006,t0.stcm007,t0.stcmstus,t0.stcm008,t0.stcm009,t0.stcm016, 
       t0.stcm017,t0.stcm010,t0.stcm011,t0.stcm012,t0.stcm018,t0.stcm013,t0.stcm014,t0.stcm015,t0.stcm019, 
       t0.stcmownid,t0.stcmowndp,t0.stcmcrtid,t0.stcmcrtdp,t0.stcmcrtdt,t0.stcmmodid,t0.stcmmoddt,t0.stcmcnfid, 
       t0.stcmcnfdt,t1.ooefl003 ,t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 , 
       t8.ooail003 ,t9.ooefl003 ,t10.ooefl003 ,t11.dbbcl003 ,t12.oojdl003 ,t13.dbbal003 ,t14.ooefl003 , 
       t15.ooag011 ,t16.ooefl003 ,t17.ooag011 ,t18.ooefl003 ,t19.ooag011 ,t20.ooag011",
               " FROM stcm_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcmsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stcm003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stcm004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stcm006 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stcm007 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stcm008  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stcm009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t8 ON t8.ooailent="||g_enterprise||" AND t8.ooail001=t0.stcm016 AND t8.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stcm010 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stcm011 AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t11 ON t11.dbbclent="||g_enterprise||" AND t11.dbbcl001=t0.stcm012 AND t11.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t12 ON t12.oojdlent="||g_enterprise||" AND t12.oojdl001=t0.stcm013 AND t12.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN dbbal_t t13 ON t13.dbbalent="||g_enterprise||" AND t13.dbbal001=t0.stcm014 AND t13.dbbal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t14 ON t14.ooeflent="||g_enterprise||" AND t14.ooefl001=t0.stcm015 AND t14.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.stcmownid  ",
               " LEFT JOIN ooefl_t t16 ON t16.ooeflent="||g_enterprise||" AND t16.ooefl001=t0.stcmowndp AND t16.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t17 ON t17.ooagent="||g_enterprise||" AND t17.ooag001=t0.stcmcrtid  ",
               " LEFT JOIN ooefl_t t18 ON t18.ooeflent="||g_enterprise||" AND t18.ooefl001=t0.stcmcrtdp AND t18.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t19 ON t19.ooagent="||g_enterprise||" AND t19.ooag001=t0.stcmmodid  ",
               " LEFT JOIN ooag_t t20 ON t20.ooagent="||g_enterprise||" AND t20.ooag001=t0.stcmcnfid  ",
 
               " WHERE t0.stcment = " ||g_enterprise|| " AND t0.stcmdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt602_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt602 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt602_init()   
 
      #進入選單 Menu (="N")
      CALL astt602_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt602
      
   END IF 
   
   CLOSE astt602_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt602.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt602_init()
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
      CALL cl_set_combo_scc_part('stcmstus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stcm005','6013') 
   CALL cl_set_combo_scc('stcn004','6006') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('b_stcm005','6013','11,12,13')
   CALL cl_set_combo_scc_part('stcm005','6013','11,12,13')
   CALL cl_set_combo_scc_part('stcn004','6006','1,2') 
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt602_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt602.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt602_ui_dialog()
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
            CALL astt602_insert()
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
         INITIALIZE g_stcm_m.* TO NULL
         CALL g_stcn_d.clear()
         CALL g_stcn2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt602_init()
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
               
               CALL astt602_fetch('') # reload data
               LET l_ac = 1
               CALL astt602_ui_detailshow() #Setting the current row 
         
               CALL astt602_idx_chk()
               #NEXT FIELD stcnseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stcn_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt602_idx_chk()
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
               CALL astt602_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_stcn2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt602_idx_chk()
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
               CALL astt602_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt602_browser_fill("")
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
               CALL astt602_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt602_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt602_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt602_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt602_set_act_visible()   
            CALL astt602_set_act_no_visible()
            IF NOT (g_stcm_m.stcmdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stcment = " ||g_enterprise|| " AND",
                                  " stcmdocno = '", g_stcm_m.stcmdocno, "' "
 
               #填到對應位置
               CALL astt602_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stcm_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcn_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stco_t" 
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
               CALL astt602_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stcm_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stcn_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stco_t" 
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
                  CALL astt602_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt602_fetch("F")
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
               CALL astt602_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt602_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt602_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt602_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt602_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt602_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt602_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt602_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt602_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt602_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt602_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stcn_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stcn2_d)
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
               NEXT FIELD stcnseq
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
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt602_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt602_insert()
               #add-point:ON ACTION insert name="menu.insert"
               EXIT DIALOG
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt602_query()
               #add-point:ON ACTION query name="menu.query"
                
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt602_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt602_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt602_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL astt602_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt602_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt602_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt602_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt602_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stcm_m.stcmdocdt)
 
 
 
         
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
 
{<section id="astt602.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt602_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_ooef019         LIKE ooef_t.ooef019
   DEFINE l_where           STRING #ken 需求單號：141208-00001 項次：21
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   CALL s_aooi500_sql_where(g_prog,'stcmsite') RETURNING l_where #ken 需求單號：141208-00001 項次：21
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
      LET l_sub_sql = " SELECT DISTINCT stcmdocno ",
                      " FROM stcm_t ",
                      " ",
                      " LEFT JOIN stcn_t ON stcnent = stcment AND stcmdocno = stcndocno ", "  ",
                      #add-point:browser_fill段sql(stcn_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN stco_t ON stcoent = stcment AND stcmdocno = stcodocno", "  ",
                      #add-point:browser_fill段sql(stco_t1) name="browser_fill.cnt.join.stco_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE stcment = " ||g_enterprise|| " AND stcnent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stcm_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stcmdocno ",
                      " FROM stcm_t ", 
                      "  ",
                      "  ",
                      " WHERE stcment = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stcm_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   LET l_sub_sql = l_sub_sql," AND ", l_where #ken 需求單號：141208-00001 項次：21
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
      INITIALIZE g_stcm_m.* TO NULL
      CALL g_stcn_d.clear()        
      CALL g_stcn2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stcmdocno,t0.stcmdocdt,t0.stcmsite,t0.stcm001,t0.stcm003,t0.stcm004,t0.stcm005,t0.stcm006,t0.stcm007,t0.stcm008,t0.stcm009,t0.stcm010,t0.stcm011,t0.stcm012,t0.stcm013,t0.stcm014,t0.stcm015,t0.stcm016,t0.stcm017,t0.stcm018,t0.stcm019,t0.stcmunit Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcmstus,t0.stcmdocno,t0.stcmdocdt,t0.stcmsite,t0.stcm001,t0.stcm003, 
          t0.stcm004,t0.stcm005,t0.stcm006,t0.stcm007,t0.stcm008,t0.stcm009,t0.stcm010,t0.stcm011,t0.stcm012, 
          t0.stcm013,t0.stcm014,t0.stcm015,t0.stcm016,t0.stcm017,t0.stcm018,t0.stcm019,t0.stcmunit,t1.ooefl003 , 
          t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.ooefl003 , 
          t9.ooefl003 ,t10.dbbcl003 ,t11.oojdl003 ,t12.dbbal003 ,t13.ooefl003 ,t14.ooail003 ",
                  " FROM stcm_t t0",
                  "  ",
                  "  LEFT JOIN stcn_t ON stcnent = stcment AND stcmdocno = stcndocno ", "  ", 
                  #add-point:browser_fill段sql(stcn_t1) name="browser_fill.join.stcn_t1"
                  
                  #end add-point
                  "  LEFT JOIN stco_t ON stcoent = stcment AND stcmdocno = stcodocno", "  ", 
                  #add-point:browser_fill段sql(stco_t1) name="browser_fill.join.stco_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcmsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stcm003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stcm004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stcm006 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stcm007 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stcm008  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stcm009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stcm010 AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stcm011 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t10 ON t10.dbbclent="||g_enterprise||" AND t10.dbbcl001=t0.stcm012 AND t10.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t11 ON t11.oojdlent="||g_enterprise||" AND t11.oojdl001=t0.stcm013 AND t11.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN dbbal_t t12 ON t12.dbbalent="||g_enterprise||" AND t12.dbbal001=t0.stcm014 AND t12.dbbal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stcm015 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t14 ON t14.ooailent="||g_enterprise||" AND t14.ooail001=t0.stcm016 AND t14.ooail002='"||g_dlang||"' ",
 
                  " WHERE t0.stcment = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stcm_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stcmstus,t0.stcmdocno,t0.stcmdocdt,t0.stcmsite,t0.stcm001,t0.stcm003, 
          t0.stcm004,t0.stcm005,t0.stcm006,t0.stcm007,t0.stcm008,t0.stcm009,t0.stcm010,t0.stcm011,t0.stcm012, 
          t0.stcm013,t0.stcm014,t0.stcm015,t0.stcm016,t0.stcm017,t0.stcm018,t0.stcm019,t0.stcmunit,t1.ooefl003 , 
          t2.pmaal004 ,t3.pmaal004 ,t4.staal003 ,t5.oocql004 ,t6.ooag011 ,t7.ooefl003 ,t8.ooefl003 , 
          t9.ooefl003 ,t10.dbbcl003 ,t11.oojdl003 ,t12.dbbal003 ,t13.ooefl003 ,t14.ooail003 ",
                  " FROM stcm_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stcmsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stcm003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.stcm004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN staal_t t4 ON t4.staalent="||g_enterprise||" AND t4.staal001=t0.stcm006 AND t4.staal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='2060' AND t5.oocql002=t0.stcm007 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stcm008  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stcm009 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.stcm010 AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stcm011 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN dbbcl_t t10 ON t10.dbbclent="||g_enterprise||" AND t10.dbbcl001=t0.stcm012 AND t10.dbbcl002='"||g_dlang||"' ",
               " LEFT JOIN oojdl_t t11 ON t11.oojdlent="||g_enterprise||" AND t11.oojdl001=t0.stcm013 AND t11.oojdl002='"||g_dlang||"' ",
               " LEFT JOIN dbbal_t t12 ON t12.dbbalent="||g_enterprise||" AND t12.dbbal001=t0.stcm014 AND t12.dbbal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.stcm015 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t14 ON t14.ooailent="||g_enterprise||" AND t14.ooail001=t0.stcm016 AND t14.ooail002='"||g_dlang||"' ",
 
                  " WHERE t0.stcment = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stcm_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   LET g_sql = g_sql," AND ", l_where #ken 需求單號：141208-00001 項次：21
   #end add-point
   LET g_sql = g_sql, " ORDER BY stcmdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stcm_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
 
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stcmdocno,g_browser[g_cnt].b_stcmdocdt, 
          g_browser[g_cnt].b_stcmsite,g_browser[g_cnt].b_stcm001,g_browser[g_cnt].b_stcm003,g_browser[g_cnt].b_stcm004, 
          g_browser[g_cnt].b_stcm005,g_browser[g_cnt].b_stcm006,g_browser[g_cnt].b_stcm007,g_browser[g_cnt].b_stcm008, 
          g_browser[g_cnt].b_stcm009,g_browser[g_cnt].b_stcm010,g_browser[g_cnt].b_stcm011,g_browser[g_cnt].b_stcm012, 
          g_browser[g_cnt].b_stcm013,g_browser[g_cnt].b_stcm014,g_browser[g_cnt].b_stcm015,g_browser[g_cnt].b_stcm016, 
          g_browser[g_cnt].b_stcm017,g_browser[g_cnt].b_stcm018,g_browser[g_cnt].b_stcm019,g_browser[g_cnt].b_stcmunit, 
          g_browser[g_cnt].b_stcmsite_desc,g_browser[g_cnt].b_stcm003_desc,g_browser[g_cnt].b_stcm004_desc, 
          g_browser[g_cnt].b_stcm006_desc,g_browser[g_cnt].b_stcm007_desc,g_browser[g_cnt].b_stcm008_desc, 
          g_browser[g_cnt].b_stcm009_desc,g_browser[g_cnt].b_stcm010_desc,g_browser[g_cnt].b_stcm011_desc, 
          g_browser[g_cnt].b_stcm012_desc,g_browser[g_cnt].b_stcm013_desc,g_browser[g_cnt].b_stcm014_desc, 
          g_browser[g_cnt].b_stcm015_desc,g_browser[g_cnt].b_stcm016_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_browser[g_cnt].b_stcmsite
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_browser[g_cnt].b_stcm017
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_oodbl004 = '', g_rtn_fields[1] , ''
         #end add-point
      
         #遮罩相關處理
         CALL astt602_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stcmdocno) THEN
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
 
{<section id="astt602.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt602_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stcm_m.stcmdocno = g_browser[g_current_idx].b_stcmdocno   
 
   EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
       g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
       g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
       g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
       g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
       g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
       g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
   
   CALL astt602_stcm_t_mask()
   CALL astt602_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt602.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt602_ui_detailshow()
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
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt602_ui_browser_refresh()
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
      IF g_browser[l_i].b_stcmdocno = g_stcm_m.stcmdocno 
 
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
 
{<section id="astt602.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt602_construct()
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
   INITIALIZE g_stcm_m.* TO NULL
   CALL g_stcn_d.clear()        
   CALL g_stcn2_d.clear() 
 
   
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
      CONSTRUCT BY NAME g_wc ON stcmsite,stcmdocdt,stcmdocno,stcmunit,stcm001,stcm003,stcm004,stcm002, 
          stcm005,stcm006,stcm007,stcmstus,stcm008,stcm009,stcm016,stcm017,stcm010,stcm011,stcm012,stcm018, 
          stcm013,stcm014,stcm015,stcm019,stcmownid,stcmowndp,stcmcrtid,stcmcrtdp,stcmcrtdt,stcmmodid, 
          stcmmoddt,stcmcnfid,stcmcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stcmcrtdt>>----
         AFTER FIELD stcmcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stcmmoddt>>----
         AFTER FIELD stcmmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcmcnfdt>>----
         AFTER FIELD stcmcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcmpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stcmsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmsite
            #add-point:ON ACTION controlp INFIELD stcmsite name="construct.c.stcmsite"
            #此段落由子樣板a08產生
            #開窗c段
            #ken_mark---------------------------s
            #INITIALIZE g_qryparam.* TO NULL
            #LET g_qryparam.state = 'c'
            #LET g_qryparam.reqry = FALSE
            #LET g_qryparam.where = " ooef201 = 'Y' " #
            #CALL q_ooef001()                            #呼叫開窗
            #DISPLAY g_qryparam.return1 TO stcmsite  #顯示到畫面上
            #NEXT FIELD stcmsite                     #返回原欄位
            #ken_mark---------------------------e

            #ken-----------------------s 需求單號：141208-00001 項次：21
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcmsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stcmsite  #顯示到畫面上
            NEXT FIELD stcmsite                     #返回原欄位
            #ken-----------------------e 需求單號：141208-00001 項次：21
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmsite
            #add-point:BEFORE FIELD stcmsite name="construct.b.stcmsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmsite
            
            #add-point:AFTER FIELD stcmsite name="construct.a.stcmsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmdocdt
            #add-point:BEFORE FIELD stcmdocdt name="construct.b.stcmdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmdocdt
            
            #add-point:AFTER FIELD stcmdocdt name="construct.a.stcmdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmdocdt
            #add-point:ON ACTION controlp INFIELD stcmdocdt name="construct.c.stcmdocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmdocno
            #add-point:BEFORE FIELD stcmdocno name="construct.b.stcmdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmdocno
            
            #add-point:AFTER FIELD stcmdocno name="construct.a.stcmdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmdocno
            #add-point:ON ACTION controlp INFIELD stcmdocno name="construct.c.stcmdocno"
            ###  ### start ###
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stcmdocno()
            DISPLAY g_qryparam.return1 TO stcmdocno
            ###  ### end ###

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmunit
            #add-point:BEFORE FIELD stcmunit name="construct.b.stcmunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmunit
            
            #add-point:AFTER FIELD stcmunit name="construct.a.stcmunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmunit
            #add-point:ON ACTION controlp INFIELD stcmunit name="construct.c.stcmunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm001
            #add-point:BEFORE FIELD stcm001 name="construct.b.stcm001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm001
            
            #add-point:AFTER FIELD stcm001 name="construct.a.stcm001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm001
            #add-point:ON ACTION controlp INFIELD stcm001 name="construct.c.stcm001"
            ###  ### start ###
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stce001_2()
            DISPLAY g_qryparam.return1 TO stcm001
            ###  ### end ###

            #END add-point
 
 
         #Ctrlp:construct.c.stcm003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm003
            #add-point:ON ACTION controlp INFIELD stcm003 name="construct.c.stcm003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm003  #顯示到畫面上
            NEXT FIELD stcm003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm003
            #add-point:BEFORE FIELD stcm003 name="construct.b.stcm003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm003
            
            #add-point:AFTER FIELD stcm003 name="construct.a.stcm003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm004
            #add-point:ON ACTION controlp INFIELD stcm004 name="construct.c.stcm004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm004  #顯示到畫面上
            NEXT FIELD stcm004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm004
            #add-point:BEFORE FIELD stcm004 name="construct.b.stcm004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm004
            
            #add-point:AFTER FIELD stcm004 name="construct.a.stcm004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm002
            #add-point:BEFORE FIELD stcm002 name="construct.b.stcm002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm002
            
            #add-point:AFTER FIELD stcm002 name="construct.a.stcm002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm002
            #add-point:ON ACTION controlp INFIELD stcm002 name="construct.c.stcm002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm005
            #add-point:BEFORE FIELD stcm005 name="construct.b.stcm005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm005
            
            #add-point:AFTER FIELD stcm005 name="construct.a.stcm005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm005
            #add-point:ON ACTION controlp INFIELD stcm005 name="construct.c.stcm005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcm006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm006
            #add-point:ON ACTION controlp INFIELD stcm006 name="construct.c.stcm006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm006  #顯示到畫面上
            NEXT FIELD stcm006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm006
            #add-point:BEFORE FIELD stcm006 name="construct.b.stcm006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm006
            
            #add-point:AFTER FIELD stcm006 name="construct.a.stcm006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm007
            #add-point:ON ACTION controlp INFIELD stcm007 name="construct.c.stcm007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '281'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm007  #顯示到畫面上
            NEXT FIELD stcm007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm007
            #add-point:BEFORE FIELD stcm007 name="construct.b.stcm007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm007
            
            #add-point:AFTER FIELD stcm007 name="construct.a.stcm007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmstus
            #add-point:BEFORE FIELD stcmstus name="construct.b.stcmstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmstus
            
            #add-point:AFTER FIELD stcmstus name="construct.a.stcmstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmstus
            #add-point:ON ACTION controlp INFIELD stcmstus name="construct.c.stcmstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcm008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm008
            #add-point:ON ACTION controlp INFIELD stcm008 name="construct.c.stcm008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm008  #顯示到畫面上
            NEXT FIELD stcm008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm008
            #add-point:BEFORE FIELD stcm008 name="construct.b.stcm008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm008
            
            #add-point:AFTER FIELD stcm008 name="construct.a.stcm008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm009
            #add-point:ON ACTION controlp INFIELD stcm009 name="construct.c.stcm009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm009  #顯示到畫面上
            NEXT FIELD stcm009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm009
            #add-point:BEFORE FIELD stcm009 name="construct.b.stcm009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm009
            
            #add-point:AFTER FIELD stcm009 name="construct.a.stcm009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm016
            #add-point:ON ACTION controlp INFIELD stcm016 name="construct.c.stcm016"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm016  #顯示到畫面上
            NEXT FIELD stcm016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm016
            #add-point:BEFORE FIELD stcm016 name="construct.b.stcm016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm016
            
            #add-point:AFTER FIELD stcm016 name="construct.a.stcm016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm017
            #add-point:ON ACTION controlp INFIELD stcm017 name="construct.c.stcm017"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmab084()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm017  #顯示到畫面上
            NEXT FIELD stcm017                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm017
            #add-point:BEFORE FIELD stcm017 name="construct.b.stcm017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm017
            
            #add-point:AFTER FIELD stcm017 name="construct.a.stcm017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm010
            #add-point:ON ACTION controlp INFIELD stcm010 name="construct.c.stcm010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef212 = 'Y' "
            CALL q_ooef001()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm010  #顯示到畫面上
            NEXT FIELD stcm010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm010
            #add-point:BEFORE FIELD stcm010 name="construct.b.stcm010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm010
            
            #add-point:AFTER FIELD stcm010 name="construct.a.stcm010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm011
            #add-point:ON ACTION controlp INFIELD stcm011 name="construct.c.stcm011"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef304 = 'Y' "
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm011  #顯示到畫面上
            NEXT FIELD stcm011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm011
            #add-point:BEFORE FIELD stcm011 name="construct.b.stcm011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm011
            
            #add-point:AFTER FIELD stcm011 name="construct.a.stcm011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm012
            #add-point:ON ACTION controlp INFIELD stcm012 name="construct.c.stcm012"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbbc001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm012  #顯示到畫面上
            NEXT FIELD stcm012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm012
            #add-point:BEFORE FIELD stcm012 name="construct.b.stcm012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm012
            
            #add-point:AFTER FIELD stcm012 name="construct.a.stcm012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm018
            #add-point:BEFORE FIELD stcm018 name="construct.b.stcm018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm018
            
            #add-point:AFTER FIELD stcm018 name="construct.a.stcm018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm018
            #add-point:ON ACTION controlp INFIELD stcm018 name="construct.c.stcm018"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcm013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm013
            #add-point:ON ACTION controlp INFIELD stcm013 name="construct.c.stcm013"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '1'
            CALL q_oojd001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm013  #顯示到畫面上
            NEXT FIELD stcm013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm013
            #add-point:BEFORE FIELD stcm013 name="construct.b.stcm013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm013
            
            #add-point:AFTER FIELD stcm013 name="construct.a.stcm013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm014
            #add-point:ON ACTION controlp INFIELD stcm014 name="construct.c.stcm014"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm014  #顯示到畫面上
            NEXT FIELD stcm014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm014
            #add-point:BEFORE FIELD stcm014 name="construct.b.stcm014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm014
            
            #add-point:AFTER FIELD stcm014 name="construct.a.stcm014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm015
            #add-point:ON ACTION controlp INFIELD stcm015 name="construct.c.stcm015"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef305 = 'Y' "
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcm015  #顯示到畫面上
            NEXT FIELD stcm015                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm015
            #add-point:BEFORE FIELD stcm015 name="construct.b.stcm015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm015
            
            #add-point:AFTER FIELD stcm015 name="construct.a.stcm015"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm019
            #add-point:BEFORE FIELD stcm019 name="construct.b.stcm019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm019
            
            #add-point:AFTER FIELD stcm019 name="construct.a.stcm019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcm019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm019
            #add-point:ON ACTION controlp INFIELD stcm019 name="construct.c.stcm019"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcmownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmownid
            #add-point:ON ACTION controlp INFIELD stcmownid name="construct.c.stcmownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcmownid  #顯示到畫面上
            NEXT FIELD stcmownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmownid
            #add-point:BEFORE FIELD stcmownid name="construct.b.stcmownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmownid
            
            #add-point:AFTER FIELD stcmownid name="construct.a.stcmownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmowndp
            #add-point:ON ACTION controlp INFIELD stcmowndp name="construct.c.stcmowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcmowndp  #顯示到畫面上
            NEXT FIELD stcmowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmowndp
            #add-point:BEFORE FIELD stcmowndp name="construct.b.stcmowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmowndp
            
            #add-point:AFTER FIELD stcmowndp name="construct.a.stcmowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmcrtid
            #add-point:ON ACTION controlp INFIELD stcmcrtid name="construct.c.stcmcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcmcrtid  #顯示到畫面上
            NEXT FIELD stcmcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmcrtid
            #add-point:BEFORE FIELD stcmcrtid name="construct.b.stcmcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmcrtid
            
            #add-point:AFTER FIELD stcmcrtid name="construct.a.stcmcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stcmcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmcrtdp
            #add-point:ON ACTION controlp INFIELD stcmcrtdp name="construct.c.stcmcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcmcrtdp  #顯示到畫面上
            NEXT FIELD stcmcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmcrtdp
            #add-point:BEFORE FIELD stcmcrtdp name="construct.b.stcmcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmcrtdp
            
            #add-point:AFTER FIELD stcmcrtdp name="construct.a.stcmcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmcrtdt
            #add-point:BEFORE FIELD stcmcrtdt name="construct.b.stcmcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcmmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmmodid
            #add-point:ON ACTION controlp INFIELD stcmmodid name="construct.c.stcmmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcmmodid  #顯示到畫面上
            NEXT FIELD stcmmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmmodid
            #add-point:BEFORE FIELD stcmmodid name="construct.b.stcmmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmmodid
            
            #add-point:AFTER FIELD stcmmodid name="construct.a.stcmmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmmoddt
            #add-point:BEFORE FIELD stcmmoddt name="construct.b.stcmmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stcmcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmcnfid
            #add-point:ON ACTION controlp INFIELD stcmcnfid name="construct.c.stcmcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcmcnfid  #顯示到畫面上
            NEXT FIELD stcmcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmcnfid
            #add-point:BEFORE FIELD stcmcnfid name="construct.b.stcmcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmcnfid
            
            #add-point:AFTER FIELD stcmcnfid name="construct.a.stcmcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmcnfdt
            #add-point:BEFORE FIELD stcmcnfdt name="construct.b.stcmcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stcnseq,stcn001,stcn002,stcn003,stcn004,stcn005,stcn006,stcn007,stcn008, 
          stcn009,stcn010,stcn011,stcn012,stcn013,stcn014,stcn015,stcn016,stcn017,stcn018,stcn019,stcnsite, 
          stcnunit
           FROM s_detail1[1].stcnseq,s_detail1[1].stcn001,s_detail1[1].stcn002,s_detail1[1].stcn003, 
               s_detail1[1].stcn004,s_detail1[1].stcn005,s_detail1[1].stcn006,s_detail1[1].stcn007,s_detail1[1].stcn008, 
               s_detail1[1].stcn009,s_detail1[1].stcn010,s_detail1[1].stcn011,s_detail1[1].stcn012,s_detail1[1].stcn013, 
               s_detail1[1].stcn014,s_detail1[1].stcn015,s_detail1[1].stcn016,s_detail1[1].stcn017,s_detail1[1].stcn018, 
               s_detail1[1].stcn019,s_detail1[1].stcnsite,s_detail1[1].stcnunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcnseq
            #add-point:BEFORE FIELD stcnseq name="construct.b.page1.stcnseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcnseq
            
            #add-point:AFTER FIELD stcnseq name="construct.a.page1.stcnseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcnseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcnseq
            #add-point:ON ACTION controlp INFIELD stcnseq name="construct.c.page1.stcnseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stcn001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn001
            #add-point:ON ACTION controlp INFIELD stcn001 name="construct.c.page1.stcn001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " stae002 = '2' "
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcn001  #顯示到畫面上
            NEXT FIELD stcn001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn001
            #add-point:BEFORE FIELD stcn001 name="construct.b.page1.stcn001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn001
            
            #add-point:AFTER FIELD stcn001 name="construct.a.page1.stcn001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn002
            #add-point:BEFORE FIELD stcn002 name="construct.b.page1.stcn002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn002
            
            #add-point:AFTER FIELD stcn002 name="construct.a.page1.stcn002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn002
            #add-point:ON ACTION controlp INFIELD stcn002 name="construct.c.page1.stcn002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn003
            #add-point:BEFORE FIELD stcn003 name="construct.b.page1.stcn003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn003
            
            #add-point:AFTER FIELD stcn003 name="construct.a.page1.stcn003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn003
            #add-point:ON ACTION controlp INFIELD stcn003 name="construct.c.page1.stcn003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn004
            #add-point:BEFORE FIELD stcn004 name="construct.b.page1.stcn004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn004
            
            #add-point:AFTER FIELD stcn004 name="construct.a.page1.stcn004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn004
            #add-point:ON ACTION controlp INFIELD stcn004 name="construct.c.page1.stcn004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn005
            #add-point:BEFORE FIELD stcn005 name="construct.b.page1.stcn005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn005
            
            #add-point:AFTER FIELD stcn005 name="construct.a.page1.stcn005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn005
            #add-point:ON ACTION controlp INFIELD stcn005 name="construct.c.page1.stcn005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn006
            #add-point:BEFORE FIELD stcn006 name="construct.b.page1.stcn006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn006
            
            #add-point:AFTER FIELD stcn006 name="construct.a.page1.stcn006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn006
            #add-point:ON ACTION controlp INFIELD stcn006 name="construct.c.page1.stcn006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn007
            #add-point:BEFORE FIELD stcn007 name="construct.b.page1.stcn007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn007
            
            #add-point:AFTER FIELD stcn007 name="construct.a.page1.stcn007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn007
            #add-point:ON ACTION controlp INFIELD stcn007 name="construct.c.page1.stcn007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn008
            #add-point:BEFORE FIELD stcn008 name="construct.b.page1.stcn008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn008
            
            #add-point:AFTER FIELD stcn008 name="construct.a.page1.stcn008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn008
            #add-point:ON ACTION controlp INFIELD stcn008 name="construct.c.page1.stcn008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn009
            #add-point:BEFORE FIELD stcn009 name="construct.b.page1.stcn009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn009
            
            #add-point:AFTER FIELD stcn009 name="construct.a.page1.stcn009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn009
            #add-point:ON ACTION controlp INFIELD stcn009 name="construct.c.page1.stcn009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn010
            #add-point:BEFORE FIELD stcn010 name="construct.b.page1.stcn010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn010
            
            #add-point:AFTER FIELD stcn010 name="construct.a.page1.stcn010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn010
            #add-point:ON ACTION controlp INFIELD stcn010 name="construct.c.page1.stcn010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn011
            #add-point:BEFORE FIELD stcn011 name="construct.b.page1.stcn011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn011
            
            #add-point:AFTER FIELD stcn011 name="construct.a.page1.stcn011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn011
            #add-point:ON ACTION controlp INFIELD stcn011 name="construct.c.page1.stcn011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn012
            #add-point:BEFORE FIELD stcn012 name="construct.b.page1.stcn012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn012
            
            #add-point:AFTER FIELD stcn012 name="construct.a.page1.stcn012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn012
            #add-point:ON ACTION controlp INFIELD stcn012 name="construct.c.page1.stcn012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn013
            #add-point:BEFORE FIELD stcn013 name="construct.b.page1.stcn013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn013
            
            #add-point:AFTER FIELD stcn013 name="construct.a.page1.stcn013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn013
            #add-point:ON ACTION controlp INFIELD stcn013 name="construct.c.page1.stcn013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn014
            #add-point:BEFORE FIELD stcn014 name="construct.b.page1.stcn014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn014
            
            #add-point:AFTER FIELD stcn014 name="construct.a.page1.stcn014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn014
            #add-point:ON ACTION controlp INFIELD stcn014 name="construct.c.page1.stcn014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn015
            #add-point:BEFORE FIELD stcn015 name="construct.b.page1.stcn015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn015
            
            #add-point:AFTER FIELD stcn015 name="construct.a.page1.stcn015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn015
            #add-point:ON ACTION controlp INFIELD stcn015 name="construct.c.page1.stcn015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn016
            #add-point:BEFORE FIELD stcn016 name="construct.b.page1.stcn016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn016
            
            #add-point:AFTER FIELD stcn016 name="construct.a.page1.stcn016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn016
            #add-point:ON ACTION controlp INFIELD stcn016 name="construct.c.page1.stcn016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn017
            #add-point:BEFORE FIELD stcn017 name="construct.b.page1.stcn017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn017
            
            #add-point:AFTER FIELD stcn017 name="construct.a.page1.stcn017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn017
            #add-point:ON ACTION controlp INFIELD stcn017 name="construct.c.page1.stcn017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn018
            #add-point:BEFORE FIELD stcn018 name="construct.b.page1.stcn018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn018
            
            #add-point:AFTER FIELD stcn018 name="construct.a.page1.stcn018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn018
            #add-point:ON ACTION controlp INFIELD stcn018 name="construct.c.page1.stcn018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn019
            #add-point:BEFORE FIELD stcn019 name="construct.b.page1.stcn019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn019
            
            #add-point:AFTER FIELD stcn019 name="construct.a.page1.stcn019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcn019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn019
            #add-point:ON ACTION controlp INFIELD stcn019 name="construct.c.page1.stcn019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcnsite
            #add-point:BEFORE FIELD stcnsite name="construct.b.page1.stcnsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcnsite
            
            #add-point:AFTER FIELD stcnsite name="construct.a.page1.stcnsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcnsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcnsite
            #add-point:ON ACTION controlp INFIELD stcnsite name="construct.c.page1.stcnsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcnunit
            #add-point:BEFORE FIELD stcnunit name="construct.b.page1.stcnunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcnunit
            
            #add-point:AFTER FIELD stcnunit name="construct.a.page1.stcnunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stcnunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcnunit
            #add-point:ON ACTION controlp INFIELD stcnunit name="construct.c.page1.stcnunit"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stcoseq,stco001,stco002,stcosite,stcounit
           FROM s_detail2[1].stcoseq,s_detail2[1].stco001,s_detail2[1].stco002,s_detail2[1].stcosite, 
               s_detail2[1].stcounit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcoseq
            #add-point:BEFORE FIELD stcoseq name="construct.b.page2.stcoseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcoseq
            
            #add-point:AFTER FIELD stcoseq name="construct.a.page2.stcoseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcoseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcoseq
            #add-point:ON ACTION controlp INFIELD stcoseq name="construct.c.page2.stcoseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.stco001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stco001
            #add-point:ON ACTION controlp INFIELD stco001 name="construct.c.page2.stco001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stco001  #顯示到畫面上
            NEXT FIELD stco001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stco001
            #add-point:BEFORE FIELD stco001 name="construct.b.page2.stco001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stco001
            
            #add-point:AFTER FIELD stco001 name="construct.a.page2.stco001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stco002
            #add-point:BEFORE FIELD stco002 name="construct.b.page2.stco002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stco002
            
            #add-point:AFTER FIELD stco002 name="construct.a.page2.stco002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stco002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stco002
            #add-point:ON ACTION controlp INFIELD stco002 name="construct.c.page2.stco002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcosite
            #add-point:BEFORE FIELD stcosite name="construct.b.page2.stcosite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcosite
            
            #add-point:AFTER FIELD stcosite name="construct.a.page2.stcosite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcosite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcosite
            #add-point:ON ACTION controlp INFIELD stcosite name="construct.c.page2.stcosite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcounit
            #add-point:BEFORE FIELD stcounit name="construct.b.page2.stcounit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcounit
            
            #add-point:AFTER FIELD stcounit name="construct.a.page2.stcounit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.stcounit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcounit
            #add-point:ON ACTION controlp INFIELD stcounit name="construct.c.page2.stcounit"
            
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
                  WHEN la_wc[li_idx].tableid = "stcm_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stcn_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stco_t" 
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
 
{<section id="astt602.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt602_filter()
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
      CONSTRUCT g_wc_filter ON stcmdocno,stcmdocdt,stcmsite,stcm001,stcm003,stcm004,stcm005,stcm006, 
          stcm007,stcm008,stcm009,stcm010,stcm011,stcm012,stcm013,stcm014,stcm015,stcm016,stcm017,stcm018, 
          stcm019,stcmunit
                          FROM s_browse[1].b_stcmdocno,s_browse[1].b_stcmdocdt,s_browse[1].b_stcmsite, 
                              s_browse[1].b_stcm001,s_browse[1].b_stcm003,s_browse[1].b_stcm004,s_browse[1].b_stcm005, 
                              s_browse[1].b_stcm006,s_browse[1].b_stcm007,s_browse[1].b_stcm008,s_browse[1].b_stcm009, 
                              s_browse[1].b_stcm010,s_browse[1].b_stcm011,s_browse[1].b_stcm012,s_browse[1].b_stcm013, 
                              s_browse[1].b_stcm014,s_browse[1].b_stcm015,s_browse[1].b_stcm016,s_browse[1].b_stcm017, 
                              s_browse[1].b_stcm018,s_browse[1].b_stcm019,s_browse[1].b_stcmunit
 
         BEFORE CONSTRUCT
               DISPLAY astt602_filter_parser('stcmdocno') TO s_browse[1].b_stcmdocno
            DISPLAY astt602_filter_parser('stcmdocdt') TO s_browse[1].b_stcmdocdt
            DISPLAY astt602_filter_parser('stcmsite') TO s_browse[1].b_stcmsite
            DISPLAY astt602_filter_parser('stcm001') TO s_browse[1].b_stcm001
            DISPLAY astt602_filter_parser('stcm003') TO s_browse[1].b_stcm003
            DISPLAY astt602_filter_parser('stcm004') TO s_browse[1].b_stcm004
            DISPLAY astt602_filter_parser('stcm005') TO s_browse[1].b_stcm005
            DISPLAY astt602_filter_parser('stcm006') TO s_browse[1].b_stcm006
            DISPLAY astt602_filter_parser('stcm007') TO s_browse[1].b_stcm007
            DISPLAY astt602_filter_parser('stcm008') TO s_browse[1].b_stcm008
            DISPLAY astt602_filter_parser('stcm009') TO s_browse[1].b_stcm009
            DISPLAY astt602_filter_parser('stcm010') TO s_browse[1].b_stcm010
            DISPLAY astt602_filter_parser('stcm011') TO s_browse[1].b_stcm011
            DISPLAY astt602_filter_parser('stcm012') TO s_browse[1].b_stcm012
            DISPLAY astt602_filter_parser('stcm013') TO s_browse[1].b_stcm013
            DISPLAY astt602_filter_parser('stcm014') TO s_browse[1].b_stcm014
            DISPLAY astt602_filter_parser('stcm015') TO s_browse[1].b_stcm015
            DISPLAY astt602_filter_parser('stcm016') TO s_browse[1].b_stcm016
            DISPLAY astt602_filter_parser('stcm017') TO s_browse[1].b_stcm017
            DISPLAY astt602_filter_parser('stcm018') TO s_browse[1].b_stcm018
            DISPLAY astt602_filter_parser('stcm019') TO s_browse[1].b_stcm019
            DISPLAY astt602_filter_parser('stcmunit') TO s_browse[1].b_stcmunit
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         DISPLAY '' TO s_browse[1].b_stcmsite_desc 
         DISPLAY '' TO s_browse[1].b_stcm003_desc
         DISPLAY '' TO s_browse[1].b_stcm004_desc
         DISPLAY '' TO s_browse[1].b_stcm006_desc
         DISPLAY '' TO s_browse[1].b_stcm007_desc
         DISPLAY '' TO s_browse[1].b_stcm008_desc
         DISPLAY '' TO s_browse[1].b_stcm009_desc
         DISPLAY '' TO s_browse[1].b_stcm010_desc
         DISPLAY '' TO s_browse[1].b_stcm011_desc
         DISPLAY '' TO s_browse[1].b_stcm012_desc
         DISPLAY '' TO s_browse[1].b_stcm013_desc
         DISPLAY '' TO s_browse[1].b_stcm014_desc
         DISPLAY '' TO s_browse[1].b_stcm015_desc
         DISPLAY '' TO s_browse[1].b_stcm016_desc
         DISPLAY '' TO s_browse[1].b_stcm017_desc
         
         
         ON ACTION controlp INFIELD b_stcmsite
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef201 = 'Y' " #
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcmsite  #顯示到畫面上
            NEXT FIELD b_stcmsite      


         ON ACTION controlp INFIELD b_stcmdocno
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stcmdocno()
            DISPLAY g_qryparam.return1 TO b_stcmdocno

         ON ACTION controlp INFIELD b_stcm001
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "c"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "1=1"
            CALL q_stce001_2()
            DISPLAY g_qryparam.return1 TO b_stcm001

         ON ACTION controlp INFIELD b_stcm003
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm003  #顯示到畫面上
            NEXT FIELD b_stcm003      

         ON ACTION controlp INFIELD b_stcm004
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm004  #顯示到畫面上
            NEXT FIELD b_stcm004  

         ON ACTION controlp INFIELD b_stcm006
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm006  #顯示到畫面上
            NEXT FIELD b_stcm006                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm007
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '281'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm007  #顯示到畫面上
            NEXT FIELD b_stcm007    

         ON ACTION controlp INFIELD b_stcm008
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm008  #顯示到畫面上
            NEXT FIELD b_stcm008                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm009
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm009  #顯示到畫面上
            NEXT FIELD b_stcm009                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm016
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm016  #顯示到畫面上
            NEXT FIELD b_stcm016                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm017
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmab084()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm017  #顯示到畫面上
            NEXT FIELD b_stcm017                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm010
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef212 = 'Y' "
            CALL q_ooef001()                         #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm010  #顯示到畫面上
            NEXT FIELD b_stcm010                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm011
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef201 = 'Y' " #
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm011  #顯示到畫面上
            NEXT FIELD b_stcm011                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm012
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbbc001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm012  #顯示到畫面上
            NEXT FIELD b_stcm012                     #返回原欄位	

         ON ACTION controlp INFIELD b_stcm013
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '1'
            CALL q_oojd001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm013  #顯示到畫面上
            NEXT FIELD b_stcm013                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm014
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_dbba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm014  #顯示到畫面上
            NEXT FIELD b_stcm014                     #返回原欄位

         ON ACTION controlp INFIELD b_stcm015
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooef305 = 'Y' "
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_stcm015  #顯示到畫面上
            NEXT FIELD b_stcm015                     #返回原欄位
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
 
      CALL astt602_filter_show('stcmdocno')
   CALL astt602_filter_show('stcmdocdt')
   CALL astt602_filter_show('stcmsite')
   CALL astt602_filter_show('stcm001')
   CALL astt602_filter_show('stcm003')
   CALL astt602_filter_show('stcm004')
   CALL astt602_filter_show('stcm005')
   CALL astt602_filter_show('stcm006')
   CALL astt602_filter_show('stcm007')
   CALL astt602_filter_show('stcm008')
   CALL astt602_filter_show('stcm009')
   CALL astt602_filter_show('stcm010')
   CALL astt602_filter_show('stcm011')
   CALL astt602_filter_show('stcm012')
   CALL astt602_filter_show('stcm013')
   CALL astt602_filter_show('stcm014')
   CALL astt602_filter_show('stcm015')
   CALL astt602_filter_show('stcm016')
   CALL astt602_filter_show('stcm017')
   CALL astt602_filter_show('stcm018')
   CALL astt602_filter_show('stcm019')
   CALL astt602_filter_show('stcmunit')
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt602_filter_parser(ps_field)
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
 
{<section id="astt602.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt602_filter_show(ps_field)
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
   LET ls_condition = astt602_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt602_query()
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
   CALL g_stcn_d.clear()
   CALL g_stcn2_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt602_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt602_browser_fill("")
      CALL astt602_fetch("")
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
      CALL astt602_filter_show('stcmdocno')
   CALL astt602_filter_show('stcmdocdt')
   CALL astt602_filter_show('stcmsite')
   CALL astt602_filter_show('stcm001')
   CALL astt602_filter_show('stcm003')
   CALL astt602_filter_show('stcm004')
   CALL astt602_filter_show('stcm005')
   CALL astt602_filter_show('stcm006')
   CALL astt602_filter_show('stcm007')
   CALL astt602_filter_show('stcm008')
   CALL astt602_filter_show('stcm009')
   CALL astt602_filter_show('stcm010')
   CALL astt602_filter_show('stcm011')
   CALL astt602_filter_show('stcm012')
   CALL astt602_filter_show('stcm013')
   CALL astt602_filter_show('stcm014')
   CALL astt602_filter_show('stcm015')
   CALL astt602_filter_show('stcm016')
   CALL astt602_filter_show('stcm017')
   CALL astt602_filter_show('stcm018')
   CALL astt602_filter_show('stcm019')
   CALL astt602_filter_show('stcmunit')
   CALL astt602_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt602_fetch("F") 
      #顯示單身筆數
      CALL astt602_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt602_fetch(p_flag)
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
   
   LET g_stcm_m.stcmdocno = g_browser[g_current_idx].b_stcmdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
       g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
       g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
       g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
       g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
       g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
       g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
   
   #遮罩相關處理
   LET g_stcm_m_mask_o.* =  g_stcm_m.*
   CALL astt602_stcm_t_mask()
   LET g_stcm_m_mask_n.* =  g_stcm_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt602_set_act_visible()   
   CALL astt602_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_stcm_m.stcmstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF NOT cl_bpm_chk() THEN    #此單據不需提交至BPM，則隱藏按鈕 
       CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stcm_m_t.* = g_stcm_m.*
   LET g_stcm_m_o.* = g_stcm_m.*
   
   LET g_data_owner = g_stcm_m.stcmownid      
   LET g_data_dept  = g_stcm_m.stcmowndp
   
   #重新顯示   
   CALL astt602_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt602_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   DEFINE l_insert      LIKE type_t.num5 #ken 需求單號：141208-00001 項次：21
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stcn_d.clear()   
   CALL g_stcn2_d.clear()  
 
 
   INITIALIZE g_stcm_m.* TO NULL             #DEFAULT 設定
   
   LET g_stcmdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stcm_m.stcmownid = g_user
      LET g_stcm_m.stcmowndp = g_dept
      LET g_stcm_m.stcmcrtid = g_user
      LET g_stcm_m.stcmcrtdp = g_dept 
      LET g_stcm_m.stcmcrtdt = cl_get_current()
      LET g_stcm_m.stcmmodid = g_user
      LET g_stcm_m.stcmmoddt = cl_get_current()
      LET g_stcm_m.stcmstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      #LET g_stcm_m.stcmsite = g_site #ken
      #ken----------------------s 需求單號：141208-00001 項次：21
      CALL s_aooi500_default(g_prog,'stcmsite',g_stcm_m.stcmsite)
         RETURNING l_insert,g_stcm_m.stcmsite
      IF l_insert = FALSE THEN
         RETURN
      END IF
      LET g_site_flag = FALSE 
      #ken----------------------e 需求單號：141208-00001 項次：21
      LET g_stcm_m.stcmunit = g_stcm_m.stcmsite
      LET g_stcm_m.stcmdocdt = g_today
      #dongsz--add--str---
      #預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stcm_m.stcmsite,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stcm_m.stcmdocno = r_doctype
      #dongsz--add--end---
      LET g_stcm_m.stcm008 = g_user
      SELECT ooag003 INTO g_stcm_m.stcm009
        FROM ooag_t 
       WHERE ooagent = g_enterprise
         AND ooag001 = g_user 
      INITIALIZE g_stcm_m_t.* TO NULL      
      LET g_stcm_m_t.* = g_stcm_m.*
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stcm_m_t.* = g_stcm_m.*
      LET g_stcm_m_o.* = g_stcm_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcm_m.stcmstus 
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
 
 
 
    
      CALL astt602_input("a")
      
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
         INITIALIZE g_stcm_m.* TO NULL
         INITIALIZE g_stcn_d TO NULL
         INITIALIZE g_stcn2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt602_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stcn_d.clear()
      #CALL g_stcn2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt602_set_act_visible()   
   CALL astt602_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcment = " ||g_enterprise|| " AND",
                      " stcmdocno = '", g_stcm_m.stcmdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt602_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt602_cl
   
   CALL astt602_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
       g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
       g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
       g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
       g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
       g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
       g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
   
   
   #遮罩相關處理
   LET g_stcm_m_mask_o.* =  g_stcm_m.*
   CALL astt602_stcm_t_mask()
   LET g_stcm_m_mask_n.* =  g_stcm_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit, 
       g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm003_desc,g_stcm_m.stcm004,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm002,g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm006_desc,g_stcm_m.stcm007,g_stcm_m.stcm007_desc, 
       g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm008_desc,g_stcm_m.stcm009,g_stcm_m.stcm009_desc, 
       g_stcm_m.stcm016,g_stcm_m.stcm016_desc,g_stcm_m.stcm017,g_stcm_m.stcm017_desc,g_stcm_m.next_b, 
       g_stcm_m.stcm010,g_stcm_m.stcm010_desc,g_stcm_m.stcm011,g_stcm_m.stcm011_desc,g_stcm_m.stcm012, 
       g_stcm_m.stcm012_desc,g_stcm_m.stcm018,g_stcm_m.num,g_stcm_m.stcm013,g_stcm_m.stcm013_desc,g_stcm_m.stcm014, 
       g_stcm_m.stcm014_desc,g_stcm_m.stcm015,g_stcm_m.stcm015_desc,g_stcm_m.stcm019,g_stcm_m.stcmownid, 
       g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmodid_desc, 
       g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfid_desc,g_stcm_m.stcmcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stcm_m.stcmownid      
   LET g_data_dept  = g_stcm_m.stcmowndp
   
   #功能已完成,通報訊息中心
   CALL astt602_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt602_modify()
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
   LET g_stcm_m_t.* = g_stcm_m.*
   LET g_stcm_m_o.* = g_stcm_m.*
   
   IF g_stcm_m.stcmdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
   CALL s_transaction_begin()
   
   OPEN astt602_cl USING g_enterprise,g_stcm_m.stcmdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt602_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt602_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
       g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
       g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
       g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
       g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
       g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
       g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt602_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stcm_m_mask_o.* =  g_stcm_m.*
   CALL astt602_stcm_t_mask()
   LET g_stcm_m_mask_n.* =  g_stcm_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL astt602_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stcm_m.stcmmodid = g_user 
LET g_stcm_m.stcmmoddt = cl_get_current()
LET g_stcm_m.stcmmodid_desc = cl_get_username(g_stcm_m.stcmmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #ADD BY zhujing 2015-4-30----(S)
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stcm_m.stcmstus MATCHES "[DR]" THEN
         LET g_stcm_m.stcmstus = "N"
      END IF
      #ADD BY zhujing 2015-4-30----(E)
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt602_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stcm_t SET (stcmmodid,stcmmoddt) = (g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt)
          WHERE stcment = g_enterprise AND stcmdocno = g_stcmdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stcm_m.* = g_stcm_m_t.*
            CALL astt602_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stcm_m.stcmdocno != g_stcm_m_t.stcmdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stcn_t SET stcndocno = g_stcm_m.stcmdocno
 
          WHERE stcnent = g_enterprise AND stcndocno = g_stcm_m_t.stcmdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stcn_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcn_t:",SQLERRMESSAGE 
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
         
         UPDATE stco_t
            SET stcodocno = g_stcm_m.stcmdocno
 
          WHERE stcoent = g_enterprise AND
                stcodocno = g_stcmdocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stco_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
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
   CALL astt602_set_act_visible()   
   CALL astt602_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stcment = " ||g_enterprise|| " AND",
                      " stcmdocno = '", g_stcm_m.stcmdocno, "' "
 
   #填到對應位置
   CALL astt602_browser_fill("")
 
   CLOSE astt602_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt602_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt602.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt602_input(p_cmd)
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
   DEFINE l_ooef004              LIKE ooef_t.ooef004
   DEFINE l_success              LIKE type_t.num5
   DEFINE l_ooef019              LIKE ooef_t.ooef019
   DEFINE l_stcw004 LIKE stcw_t.stcw004
   DEFINE l_stae006              LIKE stae_t.stae006   
   DEFINE  l_errno               LIKE type_t.chr10   #ken 需求單號：141208-00001 項次：21
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
   DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit, 
       g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm003_desc,g_stcm_m.stcm004,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm002,g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm006_desc,g_stcm_m.stcm007,g_stcm_m.stcm007_desc, 
       g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm008_desc,g_stcm_m.stcm009,g_stcm_m.stcm009_desc, 
       g_stcm_m.stcm016,g_stcm_m.stcm016_desc,g_stcm_m.stcm017,g_stcm_m.stcm017_desc,g_stcm_m.next_b, 
       g_stcm_m.stcm010,g_stcm_m.stcm010_desc,g_stcm_m.stcm011,g_stcm_m.stcm011_desc,g_stcm_m.stcm012, 
       g_stcm_m.stcm012_desc,g_stcm_m.stcm018,g_stcm_m.num,g_stcm_m.stcm013,g_stcm_m.stcm013_desc,g_stcm_m.stcm014, 
       g_stcm_m.stcm014_desc,g_stcm_m.stcm015,g_stcm_m.stcm015_desc,g_stcm_m.stcm019,g_stcm_m.stcmownid, 
       g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmodid_desc, 
       g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfid_desc,g_stcm_m.stcmcnfdt
   
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
   LET g_forupd_sql = "SELECT stcnseq,stcn001,stcn002,stcn003,stcn004,stcn005,stcn006,stcn007,stcn008, 
       stcn009,stcn010,stcn011,stcn012,stcn013,stcn014,stcn015,stcn016,stcn017,stcn018,stcn019,stcnsite, 
       stcnunit FROM stcn_t WHERE stcnent=? AND stcndocno=? AND stcnseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt602_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT stcoseq,stco001,stco002,stcosite,stcounit FROM stco_t WHERE stcoent=?  
       AND stcodocno=? AND stcoseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt602_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt602_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt602_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001, 
       g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm019
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmownid,g_stcm_m.stcmowndp,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,
                   g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt,g_stcm_m.stcmstus,g_stcm_m.stcmcnfid,
                   g_stcm_m.stcmcnfdt
   
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stcm_m.stcmsite

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcm008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcm_m.stcm008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcm008_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcm009
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcm_m.stcm009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcm009_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcm017
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcm017_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmsite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmsite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmsite_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmownid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmownid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmownid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmowndp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmowndp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmowndp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmcrtid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmcrtid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmcrtid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmcrtdp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmcrtdp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmcrtdp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmmodid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmmodid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmmodid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcmcnfid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stcm_m.stcmcnfid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcmcnfid_desc
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt602.input.head" >}
      #單頭段
      INPUT BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001, 
          g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
          g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
          g_stcm_m.stcm019 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt602_cl USING g_enterprise,g_stcm_m.stcmdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt602_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt602_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt602_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
 
            #end add-point
            CALL astt602_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmsite
            
            #add-point:AFTER FIELD stcmsite name="input.a.stcmsite"
            #ken-----------------------s 需求單號：141208-00001 項次：21
            IF NOT cl_null(g_stcm_m.stcmsite) THEN
               CALL s_aooi500_chk(g_prog,'stcmsite',g_stcm_m.stcmsite,g_stcm_m.stcmsite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stcm_m.stcmsite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcmsite = g_stcm_m_t.stcmsite
                  CALL s_desc_get_department_desc(g_stcm_m.stcmsite) RETURNING g_stcm_m.stcmsite_desc
                  DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc
                  NEXT FIELD CURRENT
               END IF
               #sakura---add---str
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'axc-00120'
               LET g_errparam.popup  = TRUE
               CALL cl_err()               
               
               LET g_stcm_m.stcmsite = g_stcm_m_t.stcmsite
               CALL s_desc_get_department_desc(g_stcm_m.stcmsite) RETURNING g_stcm_m.stcmsite_desc
               DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc
               NEXT FIELD CURRENT               
               #sakura---add---end
            END IF
            LET g_site_flag = TRUE
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcmsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcmsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcmsite_desc
            CALL astt602_set_entry(p_cmd)
            CALL astt602_set_no_entry(p_cmd)            
            #ken-----------------------e 需求單號：141208-00001 項次：21
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmsite
            #add-point:BEFORE FIELD stcmsite name="input.b.stcmsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcmsite
            #add-point:ON CHANGE stcmsite name="input.g.stcmsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmdocdt
            #add-point:BEFORE FIELD stcmdocdt name="input.b.stcmdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmdocdt
            
            #add-point:AFTER FIELD stcmdocdt name="input.a.stcmdocdt"
            IF NOT cl_null(g_stcm_m.stcmdocdt) THEN 
               CALL astt602_stcmdocdt_chk()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcmdocdt = g_stcm_m_t.stcmdocdt
                  NEXT FIELD stcmdocdt
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcmdocdt
            #add-point:ON CHANGE stcmdocdt name="input.g.stcmdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmdocno
            #add-point:BEFORE FIELD stcmdocno name="input.b.stcmdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmdocno
            
            #add-point:AFTER FIELD stcmdocno name="input.a.stcmdocno"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_stcm_m.stcmdocno) THEN 
                LET l_ooef004 = ""
                SELECT ooef004 INTO l_ooef004
                  FROM ooef_t
                 WHERE ooef001 = g_stcm_m.stcmsite
                   AND ooefent = g_enterprise
               CALL s_aooi200_chk_slip(g_stcm_m.stcmsite,l_ooef004,g_stcm_m.stcmdocno,g_prog) RETURNING l_success
               IF NOT l_success THEN
                  LET g_stcm_m.stcmdocno = g_stcmdocno_t
                  NEXT FIELD CURRENT
               END IF
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stcm_m.stcmdocno != g_stcmdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcm_t WHERE "||"stcment = '" ||g_enterprise|| "' AND "||"stcmdocno = '"||g_stcm_m.stcmdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcmdocno
            #add-point:ON CHANGE stcmdocno name="input.g.stcmdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmunit
            #add-point:BEFORE FIELD stcmunit name="input.b.stcmunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmunit
            
            #add-point:AFTER FIELD stcmunit name="input.a.stcmunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcmunit
            #add-point:ON CHANGE stcmunit name="input.g.stcmunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm001
            #add-point:BEFORE FIELD stcm001 name="input.b.stcm001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm001
            
            #add-point:AFTER FIELD stcm001 name="input.a.stcm001"
            IF NOT cl_null(g_stcm_m.stcm001) THEN 
               CALL astt602_stcm001_chk()
               IF NOT cl_null(g_errno) THEN 
                  LET g_stcm_m.stcm001 = g_stcm_m_t.stcm001
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stcm001
               END IF 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND  g_stcm_m.stcm001 != g_stcm_m_t.stcm001) THEN 
                   CALL astt602_stcm001_b()
                   IF NOT cl_null(g_errno) THEN 
                      LET g_stcm_m.stcm001 = g_stcm_m_t.stcm001
                      INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                      NEXT FIELD stcm001
                   END IF 
               END IF
               LET l_stcw004 = ''
               SELECT stcw004 INTO l_stcw004
                 FROM stcw_t
                WHERE stcw001 = g_stcm_m.stcm001
                  AND stcw005 = 'N'
                  AND stcwent=g_enterprise #160905-00007#17 add
                ORDER BY stcwseq       
               DISPLAY l_stcw004 TO next_b           
            ELSE
               DISPLAY '' TO next_b          
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm001
            #add-point:ON CHANGE stcm001 name="input.g.stcm001"
 
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm003
            
            #add-point:AFTER FIELD stcm003 name="input.a.stcm003"
            IF NOT cl_null(g_stcm_m.stcm003) THEN
               CALL astt602_stcm003_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm003 = g_stcm_m_t.stcm003
                  NEXT FIELD stcm003
               END IF 
            ELSE
               CALL astt602_stcm003_null_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  SELECT stce009 INTO g_stcm_m.stcm003
                    FROM stce_t
                   WHERE stce001 = g_stcm_m.stcm001
                         AND stceent=g_enterprise  #160905-00007#17 add
                  DISPLAY BY NAME g_stcm_m.stcm003
                  NEXT FIELD stcm003
               END IF   
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm003
            #add-point:BEFORE FIELD stcm003 name="input.b.stcm003"
 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm003
            #add-point:ON CHANGE stcm003 name="input.g.stcm003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm004
            
            #add-point:AFTER FIELD stcm004 name="input.a.stcm004"
            IF NOT cl_null(g_stcm_m.stcm004) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcm_m.stcm004
               #160318-00025#46  2016/04/28  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"
               #160318-00025#46  2016/04/28  by pengxin  add(E)
               IF NOT cl_chk_exist("v_pmaa001_14") THEN
                  LET g_stcm_m.stcm004 = g_stcm_m_t.stcm004
                  NEXT FIELD stcm004
               END IF
               CALL astt602_stcm004_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm004 = g_stcm_m_t.stcm004
                  NEXT FIELD stcm004
               END IF
            ELSE
               CALL astt602_stcm004_null_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  SELECT stce010 INTO g_stcm_m.stcm004
                    FROM stce_t
                   WHERE stce001 = g_stcm_m.stcm001
                         AND stceent=g_enterprise  #160905-00007#17 add
                  DISPLAY BY NAME g_stcm_m.stcm004
                  NEXT FIELD stcm004
               END IF    
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm004_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm004
            #add-point:BEFORE FIELD stcm004 name="input.b.stcm004"
 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm004
            #add-point:ON CHANGE stcm004 name="input.g.stcm004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm002
            #add-point:BEFORE FIELD stcm002 name="input.b.stcm002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm002
            
            #add-point:AFTER FIELD stcm002 name="input.a.stcm002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm002
            #add-point:ON CHANGE stcm002 name="input.g.stcm002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcmstus
            #add-point:BEFORE FIELD stcmstus name="input.b.stcmstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcmstus
            
            #add-point:AFTER FIELD stcmstus name="input.a.stcmstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcmstus
            #add-point:ON CHANGE stcmstus name="input.g.stcmstus"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm008
            
            #add-point:AFTER FIELD stcm008 name="input.a.stcm008"
            IF NOT cl_null(g_stcm_m.stcm008) THEN 
               CALL astt602_stcm008_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm008 = g_stcm_m_t.stcm008
                  NEXT FIELD stcm008
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm008
            #add-point:BEFORE FIELD stcm008 name="input.b.stcm008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm008
            #add-point:ON CHANGE stcm008 name="input.g.stcm008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm009
            
            #add-point:AFTER FIELD stcm009 name="input.a.stcm009"
            IF NOT cl_null(g_stcm_m.stcm009) THEN 
               CALL astt602_stcm009_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm009 = g_stcm_m_t.stcm009
                  NEXT FIELD stcm009
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm009
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm009_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm009
            #add-point:BEFORE FIELD stcm009 name="input.b.stcm009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm009
            #add-point:ON CHANGE stcm009 name="input.g.stcm009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm016
            
            #add-point:AFTER FIELD stcm016 name="input.a.stcm016"
            IF NOT cl_null(g_stcm_m.stcm016) THEN 
               CALL astt602_stcm016_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm016 = g_stcm_m_t.stcm016
                  NEXT FIELD stcm016
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm016
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm016_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm016
            #add-point:BEFORE FIELD stcm016 name="input.b.stcm016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm016
            #add-point:ON CHANGE stcm016 name="input.g.stcm016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm017
            
            #add-point:AFTER FIELD stcm017 name="input.a.stcm017"
            IF NOT cl_null(g_stcm_m.stcm017) THEN 
               CALL astt602_stcm017_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm017 = g_stcm_m_t.stcm017
                  NEXT FIELD stcm017
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm017
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm017_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm017
            #add-point:BEFORE FIELD stcm017 name="input.b.stcm017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm017
            #add-point:ON CHANGE stcm017 name="input.g.stcm017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm010
            
            #add-point:AFTER FIELD stcm010 name="input.a.stcm010"
            IF NOT cl_null(g_stcm_m.stcm010) THEN 
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcm_m.stcm010
               #160318-00025#46  2016/04/28  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00089:sub-01302|aooi100|",cl_get_progname("aooi100",g_lang,"2"),"|:EXEPROGaooi100"
               #160318-00025#46  2016/04/28  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooef001_212") THEN
                  LET g_stcm_m.stcm010 = g_stcm_m_t.stcm010
                  NEXT FIELD stcm010
               END IF 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm010
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm010_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm010
            #add-point:BEFORE FIELD stcm010 name="input.b.stcm010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm010
            #add-point:ON CHANGE stcm010 name="input.g.stcm010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm011
            
            #add-point:AFTER FIELD stcm011 name="input.a.stcm011"
            IF NOT cl_null(g_stcm_m.stcm011) THEN 
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stcm_m.stcm011
               IF NOT cl_chk_exist("v_ooef001_20") THEN
                  LET g_stcm_m.stcm011 = g_stcm_m_t.stcm011
                  NEXT FIELD stcm011
               END IF
               CALL astt602_stcm011_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm011 = g_stcm_m_t.stcm011
                  NEXT FIELD stcm011
               END IF 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm011
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm011_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm011
            #add-point:BEFORE FIELD stcm011 name="input.b.stcm011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm011
            #add-point:ON CHANGE stcm011 name="input.g.stcm011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm012
            
            #add-point:AFTER FIELD stcm012 name="input.a.stcm012"
            IF NOT cl_null(g_stcm_m.stcm012) THEN 
               CALL astt602_stcm012_chk()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               
                  LET g_stcm_m.stcm012 = g_stcm_m_t.stcm012
                  NEXT FIELD stcm012
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm012
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm012_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm012
            #add-point:BEFORE FIELD stcm012 name="input.b.stcm012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm012
            #add-point:ON CHANGE stcm012 name="input.g.stcm012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm018
            #add-point:BEFORE FIELD stcm018 name="input.b.stcm018"
            LET g_stcm_m_t.stcm018 = g_stcm_m.stcm018
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm018
            
            #add-point:AFTER FIELD stcm018 name="input.a.stcm018"
            IF NOT cl_null(g_stcm_m.stcm018) THEN 
               CALL astt602_stcm018_stcm019_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm018 = g_stcm_m_t.stcm018
                  NEXT FIELD stcm018
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm018
            #add-point:ON CHANGE stcm018 name="input.g.stcm018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcm019
            #add-point:BEFORE FIELD stcm019 name="input.b.stcm019"
            LET g_stcm_m_t.stcm019 = g_stcm_m.stcm019
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcm019
            
            #add-point:AFTER FIELD stcm019 name="input.a.stcm019"
            IF NOT cl_null(g_stcm_m.stcm019) THEN 
               CALL astt602_stcm018_stcm019_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcm_m.stcm019 = g_stcm_m_t.stcm019
                  NEXT FIELD stcm019
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcm019
            #add-point:ON CHANGE stcm019 name="input.g.stcm019"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stcmsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmsite
            #add-point:ON ACTION controlp INFIELD stcmsite name="input.c.stcmsite"
            #ken-----------------------s 需求單號：141208-00001 項次：21
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcm_m.stcmsite             #給予default值
            
            #給予arg
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcmsite',g_stcm_m.stcmsite,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()
            LET g_stcm_m.stcmsite = g_qryparam.return1
            DISPLAY g_stcm_m.stcmsite TO stcmsite
            CALL s_desc_get_department_desc(g_stcm_m.stcmsite) RETURNING g_stcm_m.stcmsite_desc
            DISPLAY BY NAME g_stcm_m.stcmsite_desc
            NEXT FIELD stcmsite                          #返回原欄位
            #ken-----------------------e 需求單號：141208-00001 項次：21
            #END add-point
 
 
         #Ctrlp:input.c.stcmdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmdocdt
            #add-point:ON ACTION controlp INFIELD stcmdocdt name="input.c.stcmdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcmdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmdocno
            #add-point:ON ACTION controlp INFIELD stcmdocno name="input.c.stcmdocno"
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		   	LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcm_m.stcmdocno             #給予default值
            LET l_ooef004 = ""
            SELECT ooef004 INTO l_ooef004
              FROM ooef_t
             WHERE ooef001 = g_stcm_m.stcmsite
               AND ooefent = g_enterprise
            #給予arg
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            CALL q_ooba002_1()                            #呼叫開窗
            LET g_stcm_m.stcmdocno = g_qryparam.return1   #將開窗取得的值回傳到變數
            DISPLAY g_stcm_m.stcmdocno TO stcmdocno       #顯示到畫面上
            NEXT FIELD stcmdocno                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stcmunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmunit
            #add-point:ON ACTION controlp INFIELD stcmunit name="input.c.stcmunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcm001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm001
            #add-point:ON ACTION controlp INFIELD stcm001 name="input.c.stcm001"
            ###  ### start ###
            INITIALIZE g_qryparam.* TO NULL 
            LET g_qryparam.state = "i"
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = ""
            IF NOT cl_null(g_stcm_m.stcmdocdt) THEN 
               LET g_qryparam.where = " stce017 <= '",g_stcm_m.stcmdocdt,"' AND stce018 >= '",g_stcm_m.stcmdocdt,"'"
            END IF 
            CALL q_stce001_2()
            LET g_stcm_m.stcm001 = g_qryparam.return1
            IF NOT cl_null(g_stcm_m.stcm001) THEN 
               LET g_stcm_m.stcm003 = g_qryparam.return2
               LET g_stcm_m.stcm004 = g_qryparam.return3
               LET g_stcm_m.stcm005 = g_qryparam.return4
               LET g_stcm_m.stcm006 = g_qryparam.return5
               LET g_stcm_m.stcm007 = g_qryparam.return6
               LET g_stcm_m.stcm002 = g_qryparam.return7
            END IF 
            DISPLAY BY NAME g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm005,
                            g_stcm_m.stcm006,g_stcm_m.stcm007
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm003_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm004_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm006
            CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm006_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm007_desc
            ###  ### end ###

            #END add-point
 
 
         #Ctrlp:input.c.stcm003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm003
            #add-point:ON ACTION controlp INFIELD stcm003 name="input.c.stcm003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcm_m.stcm003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stcm_m.stcm003 = g_qryparam.return1              

            DISPLAY g_stcm_m.stcm003 TO stcm003              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm003_desc
            NEXT FIELD stcm003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm004
            #add-point:ON ACTION controlp INFIELD stcm004 name="input.c.stcm004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcm_m.stcm004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stcm_m.stcm004 = g_qryparam.return1              

            DISPLAY g_stcm_m.stcm004 TO stcm004              #

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm004
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm004_desc
            NEXT FIELD stcm004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm002
            #add-point:ON ACTION controlp INFIELD stcm002 name="input.c.stcm002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcmstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcmstus
            #add-point:ON ACTION controlp INFIELD stcmstus name="input.c.stcmstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcm008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm008
            #add-point:ON ACTION controlp INFIELD stcm008 name="input.c.stcm008"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcm_m.stcm008             #給予default值
            #給予arg
            LET g_qryparam.arg1 = "" #
            CALL q_ooag001()                                #呼叫開窗
            LET g_stcm_m.stcm008 = g_qryparam.return1              
            DISPLAY g_stcm_m.stcm008 TO stcm008              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm008_desc
            NEXT FIELD stcm008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm009
            #add-point:ON ACTION controlp INFIELD stcm009 name="input.c.stcm009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcm_m.stcm009             #給予default值
            LET g_qryparam.default2 = "" #g_stcm_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = g_today #
            CALL q_ooeg001()                                #呼叫開窗
            LET g_stcm_m.stcm009 = g_qryparam.return1              
            LET g_stcm_m.stcm009_desc = g_qryparam.return2
            DISPLAY g_stcm_m.stcm009 TO stcm009           
            DISPLAY g_stcm_m.stcm009_desc TO stcm009_desc 
            NEXT FIELD stcm009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm016
            #add-point:ON ACTION controlp INFIELD stcm016 name="input.c.stcm016"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcm_m.stcm016             #給予default值
            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_ooaj002_1()                                #呼叫開窗
            LET g_stcm_m.stcm016 = g_qryparam.return1
            DISPLAY g_stcm_m.stcm016 TO stcm016              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm016
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm016_desc            
            NEXT FIELD stcm016                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm017
            #add-point:ON ACTION controlp INFIELD stcm017 name="input.c.stcm017"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stcm_m.stcm017             #給予default值
            #給予arg
            LET g_qryparam.arg1 = g_stcm_m.stcmsite
            CALL q_oodb002_1()
            LET g_stcm_m.stcm017 = g_qryparam.return1    
            DISPLAY g_stcm_m.stcm017 TO stcm017
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm017
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm017_desc
            NEXT FIELD stcm017                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm010
            #add-point:ON ACTION controlp INFIELD stcm010 name="input.c.stcm010"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcm_m.stcm010             #給予default值
            LET g_qryparam.default2 = "" #g_stcm_m.ooefl003 #說明(簡稱)
            #給予arg
            LET g_qryparam.where = " ooef212 = 'Y' "
            CALL q_ooef001()                              #呼叫開窗
            LET g_stcm_m.stcm010 = g_qryparam.return1
            DISPLAY g_stcm_m.stcm010 TO stcm010              
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm010
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm010_desc

            NEXT FIELD stcm010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm011
            #add-point:ON ACTION controlp INFIELD stcm011 name="input.c.stcm011"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcm_m.stcm011             #給予default值
            LET g_qryparam.default2 = "" #g_stcm_m.ooefl003 #說明(簡稱)
            #給予arg
            LET g_qryparam.where = " ooef201 = 'Y' " #
            CALL q_ooef001()                                #呼叫開窗
            LET g_stcm_m.stcm011 = g_qryparam.return1
            DISPLAY g_stcm_m.stcm011 TO stcm011              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm011
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm011_desc

            NEXT FIELD stcm011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm012
            #add-point:ON ACTION controlp INFIELD stcm012 name="input.c.stcm012"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcm_m.stcm012             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
            IF NOT cl_null(g_stcm_m.stcm011) THEN 
               LET g_qryparam.where = " dbbc002 = '",g_stcm_m.stcm011,"'"
            END IF
            CALL q_dbbc001()                                #呼叫開窗
            LET g_stcm_m.stcm012 = g_qryparam.return1              
            DISPLAY g_stcm_m.stcm012 TO stcm012              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcm_m.stcm012
            CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcm_m.stcm012_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcm_m.stcm012_desc
            NEXT FIELD stcm012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stcm018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm018
            #add-point:ON ACTION controlp INFIELD stcm018 name="input.c.stcm018"
            
            #END add-point
 
 
         #Ctrlp:input.c.stcm019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcm019
            #add-point:ON ACTION controlp INFIELD stcm019 name="input.c.stcm019"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stcm_m.stcmdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stcm_m.stcmsite,g_stcm_m.stcmdocno,g_stcm_m.stcmdocdt,g_prog) RETURNING l_success,g_stcm_m.stcmdocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stcm_m.stcmdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stcmdocno
               END IF
               LET g_stcm_m.stcmunit = g_stcm_m.stcmsite #sakura
               #end add-point
               
               INSERT INTO stcm_t (stcment,stcmsite,stcmdocdt,stcmdocno,stcmunit,stcm001,stcm003,stcm004, 
                   stcm002,stcm005,stcm006,stcm007,stcmstus,stcm008,stcm009,stcm016,stcm017,stcm010, 
                   stcm011,stcm012,stcm018,stcm013,stcm014,stcm015,stcm019,stcmownid,stcmowndp,stcmcrtid, 
                   stcmcrtdp,stcmcrtdt,stcmmodid,stcmmoddt,stcmcnfid,stcmcnfdt)
               VALUES (g_enterprise,g_stcm_m.stcmsite,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit, 
                   g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002,g_stcm_m.stcm005, 
                   g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
                   g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012, 
                   g_stcm_m.stcm018,g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019, 
                   g_stcm_m.stcmownid,g_stcm_m.stcmowndp,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt, 
                   g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stcm_m:",SQLERRMESSAGE 
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
                  CALL astt602_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt602_b_fill()
                  CALL astt602_b_fill2('0')
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
               CALL astt602_stcm_t_mask_restore('restore_mask_o')
               
               UPDATE stcm_t SET (stcmsite,stcmdocdt,stcmdocno,stcmunit,stcm001,stcm003,stcm004,stcm002, 
                   stcm005,stcm006,stcm007,stcmstus,stcm008,stcm009,stcm016,stcm017,stcm010,stcm011, 
                   stcm012,stcm018,stcm013,stcm014,stcm015,stcm019,stcmownid,stcmowndp,stcmcrtid,stcmcrtdp, 
                   stcmcrtdt,stcmmodid,stcmmoddt,stcmcnfid,stcmcnfdt) = (g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
                   g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004, 
                   g_stcm_m.stcm002,g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus, 
                   g_stcm_m.stcm008,g_stcm_m.stcm009,g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010, 
                   g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018,g_stcm_m.stcm013,g_stcm_m.stcm014, 
                   g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp,g_stcm_m.stcmcrtid, 
                   g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid, 
                   g_stcm_m.stcmcnfdt)
                WHERE stcment = g_enterprise AND stcmdocno = g_stcmdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stcm_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt602_stcm_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stcm_m_t)
               LET g_log2 = util.JSON.stringify(g_stcm_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt602.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stcn_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcn_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt602_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stcn_d.getLength()
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
            OPEN astt602_cl USING g_enterprise,g_stcm_m.stcmdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt602_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt602_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcn_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcn_d[l_ac].stcnseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stcn_d_t.* = g_stcn_d[l_ac].*  #BACKUP
               LET g_stcn_d_o.* = g_stcn_d[l_ac].*  #BACKUP
               CALL astt602_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt602_set_no_entry_b(l_cmd)
               IF NOT astt602_lock_b("stcn_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt602_bcl INTO g_stcn_d[l_ac].stcnseq,g_stcn_d[l_ac].stcn001,g_stcn_d[l_ac].stcn002, 
                      g_stcn_d[l_ac].stcn003,g_stcn_d[l_ac].stcn004,g_stcn_d[l_ac].stcn005,g_stcn_d[l_ac].stcn006, 
                      g_stcn_d[l_ac].stcn007,g_stcn_d[l_ac].stcn008,g_stcn_d[l_ac].stcn009,g_stcn_d[l_ac].stcn010, 
                      g_stcn_d[l_ac].stcn011,g_stcn_d[l_ac].stcn012,g_stcn_d[l_ac].stcn013,g_stcn_d[l_ac].stcn014, 
                      g_stcn_d[l_ac].stcn015,g_stcn_d[l_ac].stcn016,g_stcn_d[l_ac].stcn017,g_stcn_d[l_ac].stcn018, 
                      g_stcn_d[l_ac].stcn019,g_stcn_d[l_ac].stcnsite,g_stcn_d[l_ac].stcnunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stcn_d_t.stcnseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcn_d_mask_o[l_ac].* =  g_stcn_d[l_ac].*
                  CALL astt602_stcn_t_mask()
                  LET g_stcn_d_mask_n[l_ac].* =  g_stcn_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt602_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcn_d[l_ac].stcn001
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcn_d[l_ac].stcn001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcn_d[l_ac].stcn001_desc
            CALL cl_set_comp_entry('stcn004',TRUE)
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
            INITIALIZE g_stcn_d[l_ac].* TO NULL 
            INITIALIZE g_stcn_d_t.* TO NULL 
            INITIALIZE g_stcn_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stcn_d[l_ac].stcn006 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stcn_d_t.* = g_stcn_d[l_ac].*     #新輸入資料
            LET g_stcn_d_o.* = g_stcn_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt602_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
 
            #end add-point
            CALL astt602_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcn_d[li_reproduce_target].* = g_stcn_d[li_reproduce].*
 
               LET g_stcn_d[li_reproduce_target].stcnseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            SELECT MAX(stcnseq)+1 INTO g_stcn_d[l_ac].stcnseq
              FROM stcn_t
             WHERE stcnent = g_enterprise
               AND stcndocno = g_stcm_m.stcmdocno
            IF cl_null(g_stcn_d[l_ac].stcnseq) THEN 
               LET g_stcn_d[l_ac].stcnseq = 1
            END IF 
            LET g_stcn_d[l_ac].stcn002 = g_stcm_m.stcm016
            LET g_stcn_d[l_ac].stcn003 = g_stcm_m.stcm017
            LET g_stcn_d[l_ac].stcn008 = g_stcm_m.stcm002
            LET g_stcn_d[l_ac].stcn009 = g_stcm_m.stcm003
            LET g_stcn_d[l_ac].stcn010 = g_stcm_m.stcm004
            LET g_stcn_d[l_ac].stcn011 = g_stcm_m.stcm005
            LET g_stcn_d[l_ac].stcn012 = g_stcm_m.stcm007
            LET g_stcn_d[l_ac].stcn013 = g_stcm_m.stcm006
            LET g_stcn_d[l_ac].stcn014 = g_stcm_m.stcm011
            LET g_stcn_d[l_ac].stcn015 = g_stcm_m.stcm012
            LET g_stcn_d[l_ac].stcn016 = g_stcm_m.stcm013
            LET g_stcn_d[l_ac].stcn017 = g_stcm_m.stcm014
            LET g_stcn_d[l_ac].stcn018 = g_stcm_m.stcm015
            LET g_stcn_d[l_ac].stcnunit = g_stcm_m.stcmunit
            LET g_stcn_d[l_ac].stcnsite = g_stcm_m.stcmsite
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
            SELECT COUNT(1) INTO l_count FROM stcn_t 
             WHERE stcnent = g_enterprise AND stcndocno = g_stcm_m.stcmdocno
 
               AND stcnseq = g_stcn_d[l_ac].stcnseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcm_m.stcmdocno
               LET gs_keys[2] = g_stcn_d[g_detail_idx].stcnseq
               CALL astt602_insert_b('stcn_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stcn_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stcn_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt602_b_fill()
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
               LET gs_keys[01] = g_stcm_m.stcmdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stcn_d_t.stcnseq
 
            
               #刪除同層單身
               IF NOT astt602_delete_b('stcn_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt602_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt602_key_delete_b(gs_keys,'stcn_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt602_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt602_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stcn_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcn_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcnseq
            #add-point:BEFORE FIELD stcnseq name="input.b.page1.stcnseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcnseq
            
            #add-point:AFTER FIELD stcnseq name="input.a.page1.stcnseq"
            #此段落由子樣板a05產生
            IF  g_stcm_m.stcmdocno IS NOT NULL AND g_stcn_d[g_detail_idx].stcnseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stcm_m.stcmdocno != g_stcmdocno_t OR g_stcn_d[g_detail_idx].stcnseq != g_stcn_d_t.stcnseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcn_t WHERE "||"stcnent = '" ||g_enterprise|| "' AND "||"stcndocno = '"||g_stcm_m.stcmdocno ||"' AND "|| "stcnseq = '"||g_stcn_d[g_detail_idx].stcnseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcnseq
            #add-point:ON CHANGE stcnseq name="input.g.page1.stcnseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn001
            
            #add-point:AFTER FIELD stcn001 name="input.a.page1.stcn001"
            IF NOT cl_null(g_stcn_d[l_ac].stcn001) THEN 
               CALL astt602_stcn001_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcn_d[l_ac].stcn001 = g_stcn_d_t.stcn001
                  NEXT FIELD stcn001
               END IF 
               IF NOT cl_null(g_stcn_d[l_ac].stcn005) THEN 
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcn_d[l_ac].stcn001 != g_stcn_d_t.stcn001) THEN 
                     CALL astt602_stcn001_stcn005_chk()
                     IF NOT cl_null(g_errno) THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stcn_d[l_ac].stcn001 = g_stcn_d_t.stcn001
                        NEXT FIELD stcn001
                     END IF 
                  END IF 
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcn_d[l_ac].stcn001
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcn_d[l_ac].stcn001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stcn_d[l_ac].stcn001_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn001
            #add-point:BEFORE FIELD stcn001 name="input.b.page1.stcn001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn001
            #add-point:ON CHANGE stcn001 name="input.g.page1.stcn001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn002
            #add-point:BEFORE FIELD stcn002 name="input.b.page1.stcn002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn002
            
            #add-point:AFTER FIELD stcn002 name="input.a.page1.stcn002"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn002
            #add-point:ON CHANGE stcn002 name="input.g.page1.stcn002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn003
            #add-point:BEFORE FIELD stcn003 name="input.b.page1.stcn003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn003
            
            #add-point:AFTER FIELD stcn003 name="input.a.page1.stcn003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn003
            #add-point:ON CHANGE stcn003 name="input.g.page1.stcn003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn004
            #add-point:BEFORE FIELD stcn004 name="input.b.page1.stcn004"
            IF NOT cl_null(g_stcn_d[l_ac].stcn001) THEN 
               SELECT stae006
                 INTO l_stae006
                 FROM stae_t
                WHERE stae001 = g_stcn_d[l_ac].stcn001 
                  AND staeent = g_enterprise
               IF l_stae006 = '3' THEN  
                  CALL cl_set_comp_entry('stcn004',TRUE)
               ELSE
                  LET g_stcn_d[l_ac].stcn004 = l_stae006
                  CALL cl_set_comp_entry('stcn004',FALSE)
               END IF 
            ELSE
               CALL cl_set_comp_entry('stcn004',TRUE)
            END IF 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn004
            
            #add-point:AFTER FIELD stcn004 name="input.a.page1.stcn004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn004
            #add-point:ON CHANGE stcn004 name="input.g.page1.stcn004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn005
            #add-point:BEFORE FIELD stcn005 name="input.b.page1.stcn005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn005
            
            #add-point:AFTER FIELD stcn005 name="input.a.page1.stcn005"
            IF NOT cl_null(g_stcn_d[l_ac].stcn005) THEN 
              IF g_stcn_d[l_ac].stcn005 <> g_stcn_d_o.stcn005 OR cl_null(g_stcn_d_o.stcn005) THEN   #160824-00007#195 161120 by lori add   
                 CALL astt602_stcn005_chk()
                 IF NOT cl_null(g_errno) THEN 
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = g_errno
                    LET g_errparam.extend = ''
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                
                    LET g_stcn_d[l_ac].stcn005 = g_stcn_d_o.stcn005   #160824-00007#195 161120 by lori mod:g_stcn_d_t.stcn005->g_stcn_d_o.stcn005
                    NEXT FIELD stcn005
                 END IF 
                 IF NOT cl_null(g_stcn_d[l_ac].stcn001) THEN 
                   #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcn_d[l_ac].stcn005 != g_stcn_d_t.stcn005) THEN    #160824-00007#195 161120 by lori mark
                       CALL astt602_stcn001_stcn005_chk()
                       IF NOT cl_null(g_errno) THEN 
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = g_errno
                          LET g_errparam.extend = ''
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                
                          LET g_stcn_d[l_ac].stcn005 = g_stcn_d_o.stcn005   #160824-00007#195 161120 by lori mod:g_stcn_d_t.stcn005->g_stcn_d_o.stcn005
                          NEXT FIELD stcn005
                       END IF
                   #END IF   #160824-00007#195 161120 by lori mark
                 END IF  
                #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcn_d[l_ac].stcn005 != g_stcn_d_t.stcn005) THEN    #160824-00007#195 161120 by lori mark
                    IF cl_null(g_stcn_d[l_ac].stcn007) THEN 
                       LET g_stcn_d[l_ac].stcn007 = g_stcn_d[l_ac].stcn005
                    END IF 
                #END IF   #160824-00007#195 161120 by lori mark
               END IF     #160824-00007#195 161120 by lori add 
            END IF 
            
            LET g_stcn_d_o.stcn005 = g_stcn_d[l_ac].stcn005   #160824-00007#195 161120 by lori add
            LET g_stcn_d_o.stcn007 = g_stcn_d[l_ac].stcn007   #160824-00007#195 161120 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn005
            #add-point:ON CHANGE stcn005 name="input.g.page1.stcn005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn006
            #add-point:BEFORE FIELD stcn006 name="input.b.page1.stcn006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn006
            
            #add-point:AFTER FIELD stcn006 name="input.a.page1.stcn006"
            IF NOT cl_null(g_stcn_d[l_ac].stcn006) THEN 
               IF g_stcn_d[l_ac].stcn006 < 0 THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00067'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcn_d[l_ac].stcn006 = g_stcn_d_t.stcn006
                  NEXT FIELD stcn006
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn006
            #add-point:ON CHANGE stcn006 name="input.g.page1.stcn006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn007
            #add-point:BEFORE FIELD stcn007 name="input.b.page1.stcn007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn007
            
            #add-point:AFTER FIELD stcn007 name="input.a.page1.stcn007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn007
            #add-point:ON CHANGE stcn007 name="input.g.page1.stcn007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn008
            #add-point:BEFORE FIELD stcn008 name="input.b.page1.stcn008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn008
            
            #add-point:AFTER FIELD stcn008 name="input.a.page1.stcn008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn008
            #add-point:ON CHANGE stcn008 name="input.g.page1.stcn008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn009
            #add-point:BEFORE FIELD stcn009 name="input.b.page1.stcn009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn009
            
            #add-point:AFTER FIELD stcn009 name="input.a.page1.stcn009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn009
            #add-point:ON CHANGE stcn009 name="input.g.page1.stcn009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn010
            #add-point:BEFORE FIELD stcn010 name="input.b.page1.stcn010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn010
            
            #add-point:AFTER FIELD stcn010 name="input.a.page1.stcn010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn010
            #add-point:ON CHANGE stcn010 name="input.g.page1.stcn010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn011
            #add-point:BEFORE FIELD stcn011 name="input.b.page1.stcn011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn011
            
            #add-point:AFTER FIELD stcn011 name="input.a.page1.stcn011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn011
            #add-point:ON CHANGE stcn011 name="input.g.page1.stcn011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn012
            #add-point:BEFORE FIELD stcn012 name="input.b.page1.stcn012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn012
            
            #add-point:AFTER FIELD stcn012 name="input.a.page1.stcn012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn012
            #add-point:ON CHANGE stcn012 name="input.g.page1.stcn012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn013
            #add-point:BEFORE FIELD stcn013 name="input.b.page1.stcn013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn013
            
            #add-point:AFTER FIELD stcn013 name="input.a.page1.stcn013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn013
            #add-point:ON CHANGE stcn013 name="input.g.page1.stcn013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn014
            #add-point:BEFORE FIELD stcn014 name="input.b.page1.stcn014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn014
            
            #add-point:AFTER FIELD stcn014 name="input.a.page1.stcn014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn014
            #add-point:ON CHANGE stcn014 name="input.g.page1.stcn014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn015
            #add-point:BEFORE FIELD stcn015 name="input.b.page1.stcn015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn015
            
            #add-point:AFTER FIELD stcn015 name="input.a.page1.stcn015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn015
            #add-point:ON CHANGE stcn015 name="input.g.page1.stcn015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn016
            #add-point:BEFORE FIELD stcn016 name="input.b.page1.stcn016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn016
            
            #add-point:AFTER FIELD stcn016 name="input.a.page1.stcn016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn016
            #add-point:ON CHANGE stcn016 name="input.g.page1.stcn016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn017
            #add-point:BEFORE FIELD stcn017 name="input.b.page1.stcn017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn017
            
            #add-point:AFTER FIELD stcn017 name="input.a.page1.stcn017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn017
            #add-point:ON CHANGE stcn017 name="input.g.page1.stcn017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn018
            #add-point:BEFORE FIELD stcn018 name="input.b.page1.stcn018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn018
            
            #add-point:AFTER FIELD stcn018 name="input.a.page1.stcn018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn018
            #add-point:ON CHANGE stcn018 name="input.g.page1.stcn018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcn019
            #add-point:BEFORE FIELD stcn019 name="input.b.page1.stcn019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcn019
            
            #add-point:AFTER FIELD stcn019 name="input.a.page1.stcn019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcn019
            #add-point:ON CHANGE stcn019 name="input.g.page1.stcn019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcnsite
            #add-point:BEFORE FIELD stcnsite name="input.b.page1.stcnsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcnsite
            
            #add-point:AFTER FIELD stcnsite name="input.a.page1.stcnsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcnsite
            #add-point:ON CHANGE stcnsite name="input.g.page1.stcnsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcnunit
            #add-point:BEFORE FIELD stcnunit name="input.b.page1.stcnunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcnunit
            
            #add-point:AFTER FIELD stcnunit name="input.a.page1.stcnunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcnunit
            #add-point:ON CHANGE stcnunit name="input.g.page1.stcnunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stcnseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcnseq
            #add-point:ON ACTION controlp INFIELD stcnseq name="input.c.page1.stcnseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn001
            #add-point:ON ACTION controlp INFIELD stcn001 name="input.c.page1.stcn001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcn_d[l_ac].stcn001             #給予default值
            LET g_qryparam.default2 = "" #g_stcn_d[l_ac].stael004 #助記碼
            LET g_qryparam.default3 = "" #g_stcn_d[l_ac].stael003 #說明
            LET g_qryparam.where = " stae002 = '2' "
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_stae001()                                #呼叫開窗

            LET g_stcn_d[l_ac].stcn001 = g_qryparam.return1              
            LET g_stcn_d[l_ac].stcn001_desc = g_qryparam.return2 
            DISPLAY g_stcn_d[l_ac].stcn001 TO stcn001          
            DISPLAY g_stcn_d[l_ac].stcn001_desc TO stcn001_desc #說明
            NEXT FIELD stcn001                           #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn002
            #add-point:ON ACTION controlp INFIELD stcn002 name="input.c.page1.stcn002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn003
            #add-point:ON ACTION controlp INFIELD stcn003 name="input.c.page1.stcn003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn004
            #add-point:ON ACTION controlp INFIELD stcn004 name="input.c.page1.stcn004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn005
            #add-point:ON ACTION controlp INFIELD stcn005 name="input.c.page1.stcn005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn006
            #add-point:ON ACTION controlp INFIELD stcn006 name="input.c.page1.stcn006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn007
            #add-point:ON ACTION controlp INFIELD stcn007 name="input.c.page1.stcn007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn008
            #add-point:ON ACTION controlp INFIELD stcn008 name="input.c.page1.stcn008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn009
            #add-point:ON ACTION controlp INFIELD stcn009 name="input.c.page1.stcn009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn010
            #add-point:ON ACTION controlp INFIELD stcn010 name="input.c.page1.stcn010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn011
            #add-point:ON ACTION controlp INFIELD stcn011 name="input.c.page1.stcn011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn012
            #add-point:ON ACTION controlp INFIELD stcn012 name="input.c.page1.stcn012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn013
            #add-point:ON ACTION controlp INFIELD stcn013 name="input.c.page1.stcn013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn014
            #add-point:ON ACTION controlp INFIELD stcn014 name="input.c.page1.stcn014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn015
            #add-point:ON ACTION controlp INFIELD stcn015 name="input.c.page1.stcn015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn016
            #add-point:ON ACTION controlp INFIELD stcn016 name="input.c.page1.stcn016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn017
            #add-point:ON ACTION controlp INFIELD stcn017 name="input.c.page1.stcn017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn018
            #add-point:ON ACTION controlp INFIELD stcn018 name="input.c.page1.stcn018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcn019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcn019
            #add-point:ON ACTION controlp INFIELD stcn019 name="input.c.page1.stcn019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcnsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcnsite
            #add-point:ON ACTION controlp INFIELD stcnsite name="input.c.page1.stcnsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stcnunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcnunit
            #add-point:ON ACTION controlp INFIELD stcnunit name="input.c.page1.stcnunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stcn_d[l_ac].* = g_stcn_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt602_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stcn_d[l_ac].stcnseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stcn_d[l_ac].* = g_stcn_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt602_stcn_t_mask_restore('restore_mask_o')
      
               UPDATE stcn_t SET (stcndocno,stcnseq,stcn001,stcn002,stcn003,stcn004,stcn005,stcn006, 
                   stcn007,stcn008,stcn009,stcn010,stcn011,stcn012,stcn013,stcn014,stcn015,stcn016,stcn017, 
                   stcn018,stcn019,stcnsite,stcnunit) = (g_stcm_m.stcmdocno,g_stcn_d[l_ac].stcnseq,g_stcn_d[l_ac].stcn001, 
                   g_stcn_d[l_ac].stcn002,g_stcn_d[l_ac].stcn003,g_stcn_d[l_ac].stcn004,g_stcn_d[l_ac].stcn005, 
                   g_stcn_d[l_ac].stcn006,g_stcn_d[l_ac].stcn007,g_stcn_d[l_ac].stcn008,g_stcn_d[l_ac].stcn009, 
                   g_stcn_d[l_ac].stcn010,g_stcn_d[l_ac].stcn011,g_stcn_d[l_ac].stcn012,g_stcn_d[l_ac].stcn013, 
                   g_stcn_d[l_ac].stcn014,g_stcn_d[l_ac].stcn015,g_stcn_d[l_ac].stcn016,g_stcn_d[l_ac].stcn017, 
                   g_stcn_d[l_ac].stcn018,g_stcn_d[l_ac].stcn019,g_stcn_d[l_ac].stcnsite,g_stcn_d[l_ac].stcnunit) 
 
                WHERE stcnent = g_enterprise AND stcndocno = g_stcm_m.stcmdocno 
 
                  AND stcnseq = g_stcn_d_t.stcnseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcn_d[l_ac].* = g_stcn_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcn_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcn_d[l_ac].* = g_stcn_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stcn_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcm_m.stcmdocno
               LET gs_keys_bak[1] = g_stcmdocno_t
               LET gs_keys[2] = g_stcn_d[g_detail_idx].stcnseq
               LET gs_keys_bak[2] = g_stcn_d_t.stcnseq
               CALL astt602_update_b('stcn_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt602_stcn_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stcn_d[g_detail_idx].stcnseq = g_stcn_d_t.stcnseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stcm_m.stcmdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stcn_d_t.stcnseq
 
                  CALL astt602_key_update_b(gs_keys,'stcn_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stcm_m),util.JSON.stringify(g_stcn_d_t)
               LET g_log2 = util.JSON.stringify(g_stcm_m),util.JSON.stringify(g_stcn_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt602_unlock_b("stcn_t","'1'")
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
               LET g_stcn_d[li_reproduce_target].* = g_stcn_d[li_reproduce].*
 
               LET g_stcn_d[li_reproduce_target].stcnseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcn_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcn_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stcn2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcn2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt602_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_stcn2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
 
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stcn2_d[l_ac].* TO NULL 
            INITIALIZE g_stcn2_d_t.* TO NULL 
            INITIALIZE g_stcn2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
            
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_stcn2_d_t.* = g_stcn2_d[l_ac].*     #新輸入資料
            LET g_stcn2_d_o.* = g_stcn2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt602_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL astt602_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcn2_d[li_reproduce_target].* = g_stcn2_d[li_reproduce].*
 
               LET g_stcn2_d[li_reproduce_target].stcoseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            SELECT MAX(stcoseq)+1 INTO g_stcn2_d[l_ac].stcoseq
              FROM stco_t
             WHERE stcoent = g_enterprise
               AND stcodocno = g_stcm_m.stcmdocno
            IF cl_null(g_stcn2_d[l_ac].stcoseq) THEN 
               LET g_stcn2_d[l_ac].stcoseq = 1
            END IF
            LET g_stcn2_d[l_ac].stcounit = g_stcm_m.stcmunit
            LET g_stcn2_d[l_ac].stcosite = g_stcm_m.stcmsite
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
            OPEN astt602_cl USING g_enterprise,g_stcm_m.stcmdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt602_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt602_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stcn2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcn2_d[l_ac].stcoseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stcn2_d_t.* = g_stcn2_d[l_ac].*  #BACKUP
               LET g_stcn2_d_o.* = g_stcn2_d[l_ac].*  #BACKUP
               CALL astt602_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL astt602_set_no_entry_b(l_cmd)
               IF NOT astt602_lock_b("stco_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt602_bcl2 INTO g_stcn2_d[l_ac].stcoseq,g_stcn2_d[l_ac].stco001,g_stcn2_d[l_ac].stco002, 
                      g_stcn2_d[l_ac].stcosite,g_stcn2_d[l_ac].stcounit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stcn2_d_mask_o[l_ac].* =  g_stcn2_d[l_ac].*
                  CALL astt602_stco_t_mask()
                  LET g_stcn2_d_mask_n[l_ac].* =  g_stcn2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt602_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcn2_d[l_ac].stco001
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcn2_d[l_ac].stco001_desc = '', g_rtn_fields[1] , ''
            LET g_stcn2_d[l_ac].stco001_desc_desc = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stcn2_d[l_ac].stco001_desc,g_stcn2_d[l_ac].stco001_desc_desc
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
               LET gs_keys[01] = g_stcm_m.stcmdocno
               LET gs_keys[gs_keys.getLength()+1] = g_stcn2_d_t.stcoseq
            
               #刪除同層單身
               IF NOT astt602_delete_b('stco_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt602_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt602_key_delete_b(gs_keys,'stco_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt602_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE astt602_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
               LET l_count = g_stcn_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stcn2_d.getLength() + 1) THEN
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
            SELECT COUNT(1) INTO l_count FROM stco_t 
             WHERE stcoent = g_enterprise AND stcodocno = g_stcm_m.stcmdocno
               AND stcoseq = g_stcn2_d[l_ac].stcoseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcm_m.stcmdocno
               LET gs_keys[2] = g_stcn2_d[g_detail_idx].stcoseq
               CALL astt602_insert_b('stco_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_stcn_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt602_b_fill()
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
               LET g_stcn2_d[l_ac].* = g_stcn2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt602_bcl2
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
               LET g_stcn2_d[l_ac].* = g_stcn2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL astt602_stco_t_mask_restore('restore_mask_o')
                              
               UPDATE stco_t SET (stcodocno,stcoseq,stco001,stco002,stcosite,stcounit) = (g_stcm_m.stcmdocno, 
                   g_stcn2_d[l_ac].stcoseq,g_stcn2_d[l_ac].stco001,g_stcn2_d[l_ac].stco002,g_stcn2_d[l_ac].stcosite, 
                   g_stcn2_d[l_ac].stcounit) #自訂欄位頁簽
                WHERE stcoent = g_enterprise AND stcodocno = g_stcm_m.stcmdocno
                  AND stcoseq = g_stcn2_d_t.stcoseq #項次 
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stcn2_d[l_ac].* = g_stcn2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stco_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stcn2_d[l_ac].* = g_stcn2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stcm_m.stcmdocno
               LET gs_keys_bak[1] = g_stcmdocno_t
               LET gs_keys[2] = g_stcn2_d[g_detail_idx].stcoseq
               LET gs_keys_bak[2] = g_stcn2_d_t.stcoseq
               CALL astt602_update_b('stco_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL astt602_stco_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_stcn2_d[g_detail_idx].stcoseq = g_stcn2_d_t.stcoseq 
                  ) THEN
                  LET gs_keys[01] = g_stcm_m.stcmdocno
                  LET gs_keys[gs_keys.getLength()+1] = g_stcn2_d_t.stcoseq
                  CALL astt602_key_update_b(gs_keys,'stco_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stcm_m),util.JSON.stringify(g_stcn2_d_t)
               LET g_log2 = util.JSON.stringify(g_stcm_m),util.JSON.stringify(g_stcn2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcoseq
            #add-point:BEFORE FIELD stcoseq name="input.b.page2.stcoseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcoseq
            
            #add-point:AFTER FIELD stcoseq name="input.a.page2.stcoseq"
            #此段落由子樣板a05產生
            IF  g_stcm_m.stcmdocno IS NOT NULL AND g_stcn2_d[g_detail_idx].stcoseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stcm_m.stcmdocno != g_stcmdocno_t OR g_stcn2_d[g_detail_idx].stcoseq != g_stcn2_d_t.stcoseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stco_t WHERE "||"stcoent = '" ||g_enterprise|| "' AND "||"stcodocno = '"||g_stcm_m.stcmdocno ||"' AND "|| "stcoseq = '"||g_stcn2_d[g_detail_idx].stcoseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcoseq
            #add-point:ON CHANGE stcoseq name="input.g.page2.stcoseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stco001
            
            #add-point:AFTER FIELD stco001 name="input.a.page2.stco001"
            IF NOT cl_null(g_stcn2_d[l_ac].stco001) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcn2_d[l_ac].stco001 != g_stcn2_d_t.stco001) THEN    #160824-00007#195 161120 by lori add
                  CALL astt602_stco001_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     LET g_stcn2_d[l_ac].stco001 = g_stcn2_d_t.stco001
                     NEXT FIELD stco001
                  END IF 
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_stcn2_d[l_ac].stco001 != g_stcn2_d_t.stco001) THEN    #160824-00007#195 161120 by lori mark
                  LET l_n = 0
                  SELECT COUNT(*) INTO l_n 
                    FROM stco_t
                   WHERE stcoent = g_enterprise
                     AND stcodocno = g_stcm_m.stcmdocno
                     AND stco001 = g_stcn2_d[l_ac].stco001
                  IF l_n > 0 THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00069'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stcn2_d[l_ac].stco001 = g_stcn2_d_t.stco001
                     NEXT FIELD stco001
                  END IF 
               END IF                
            END IF 

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stcn2_d[l_ac].stco001
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stcn2_d[l_ac].stco001_desc = '', g_rtn_fields[1] , ''
            LET g_stcn2_d[l_ac].stco001_desc_desc = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_stcn2_d[l_ac].stco001_desc,g_stcn2_d[l_ac].stco001_desc_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stco001
            #add-point:BEFORE FIELD stco001 name="input.b.page2.stco001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stco001
            #add-point:ON CHANGE stco001 name="input.g.page2.stco001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stco002
            #add-point:BEFORE FIELD stco002 name="input.b.page2.stco002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stco002
            
            #add-point:AFTER FIELD stco002 name="input.a.page2.stco002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stco002
            #add-point:ON CHANGE stco002 name="input.g.page2.stco002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcosite
            #add-point:BEFORE FIELD stcosite name="input.b.page2.stcosite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcosite
            
            #add-point:AFTER FIELD stcosite name="input.a.page2.stcosite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcosite
            #add-point:ON CHANGE stcosite name="input.g.page2.stcosite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stcounit
            #add-point:BEFORE FIELD stcounit name="input.b.page2.stcounit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stcounit
            
            #add-point:AFTER FIELD stcounit name="input.a.page2.stcounit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stcounit
            #add-point:ON CHANGE stcounit name="input.g.page2.stcounit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.stcoseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcoseq
            #add-point:ON ACTION controlp INFIELD stcoseq name="input.c.page2.stcoseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stco001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stco001
            #add-point:ON ACTION controlp INFIELD stco001 name="input.c.page2.stco001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcn2_d[l_ac].stco001
            #給予arg
            LET g_qryparam.arg1 = "" #
            CALL q_imaa001()
            LET g_stcn2_d[l_ac].stco001 = g_qryparam.return1              
            LET g_stcn2_d[l_ac].stco001_desc = g_qryparam.return2 
            LET g_stcn2_d[l_ac].stco001_desc_desc = g_qryparam.return3 
            DISPLAY g_stcn2_d[l_ac].stco001 TO stco001              #
            DISPLAY g_stcn2_d[l_ac].stco001_desc TO stco001_desc #品名
            DISPLAY g_stcn2_d[l_ac].stco001_desc_desc TO stco001_desc_desc #規格
            NEXT FIELD stco001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.stco002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stco002
            #add-point:ON ACTION controlp INFIELD stco002 name="input.c.page2.stco002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcosite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcosite
            #add-point:ON ACTION controlp INFIELD stcosite name="input.c.page2.stcosite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.stcounit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stcounit
            #add-point:ON ACTION controlp INFIELD stcounit name="input.c.page2.stcounit"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stcn2_d[l_ac].* = g_stcn2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt602_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt602_unlock_b("stco_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body2.after_row2"
            LET l_n = 0
            SELECT COUNT(*) INTO l_n
              FROM stco_t
             WHERE stcoent = g_enterprise
               AND stcodocno = g_stcm_m.stcmdocno
            DISPLAY l_n TO num
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stcn2_d[li_reproduce_target].* = g_stcn2_d[li_reproduce].*
 
               LET g_stcn2_d[li_reproduce_target].stcoseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_stcn2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stcn2_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="astt602.input.other" >}
      
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
            NEXT FIELD stcmsite  #ken
            #end add-point  
            NEXT FIELD stcmdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcnseq
               WHEN "s_detail2"
                  NEXT FIELD stcoseq
 
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
 
{<section id="astt602.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt602_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_ooef019 LIKE ooef_t.ooef019
   DEFINE l_n       LIKE type_t.num5
   DEFINE l_stcw004 LIKE stcw_t.stcw004
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt602_b_fill() #單身填充
      CALL astt602_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt602_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stcm_m.stcmsite

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcm_m.stcm017
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcm_m.stcm017_desc
     
   #end add-point
   
   #遮罩相關處理
   LET g_stcm_m_mask_o.* =  g_stcm_m.*
   CALL astt602_stcm_t_mask()
   LET g_stcm_m_mask_n.* =  g_stcm_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit, 
       g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm003_desc,g_stcm_m.stcm004,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm002,g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm006_desc,g_stcm_m.stcm007,g_stcm_m.stcm007_desc, 
       g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm008_desc,g_stcm_m.stcm009,g_stcm_m.stcm009_desc, 
       g_stcm_m.stcm016,g_stcm_m.stcm016_desc,g_stcm_m.stcm017,g_stcm_m.stcm017_desc,g_stcm_m.next_b, 
       g_stcm_m.stcm010,g_stcm_m.stcm010_desc,g_stcm_m.stcm011,g_stcm_m.stcm011_desc,g_stcm_m.stcm012, 
       g_stcm_m.stcm012_desc,g_stcm_m.stcm018,g_stcm_m.num,g_stcm_m.stcm013,g_stcm_m.stcm013_desc,g_stcm_m.stcm014, 
       g_stcm_m.stcm014_desc,g_stcm_m.stcm015,g_stcm_m.stcm015_desc,g_stcm_m.stcm019,g_stcm_m.stcmownid, 
       g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmodid_desc, 
       g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfid_desc,g_stcm_m.stcmcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcm_m.stcmstus 
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
   FOR l_ac = 1 TO g_stcn_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
 
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stcn2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
 
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM stco_t
    WHERE stcoent = g_enterprise
      AND stcodocno = g_stcm_m.stcmdocno
   DISPLAY l_n TO num
   LET l_stcw004 = ''
   SELECT stcw004 INTO l_stcw004
     FROM stcw_t
    WHERE stcw001 = g_stcm_m.stcm001
      AND stcw005 = 'N'
      AND stcwent=g_enterprise  #160905-00007#17 add
    ORDER BY stcwseq       
   DISPLAY l_stcw004 TO next_b     
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt602_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt602_detail_show()
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
 
{<section id="astt602.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt602_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stcm_t.stcmdocno 
   DEFINE l_oldno     LIKE stcm_t.stcmdocno 
 
   DEFINE l_master    RECORD LIKE stcm_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stcn_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stco_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   DEFINE l_insert      LIKE type_t.num5 #ken 需求單號：141208-00001 項次：21   
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
   
   IF g_stcm_m.stcmdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
    
   LET g_stcm_m.stcmdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stcm_m.stcmownid = g_user
      LET g_stcm_m.stcmowndp = g_dept
      LET g_stcm_m.stcmcrtid = g_user
      LET g_stcm_m.stcmcrtdp = g_dept 
      LET g_stcm_m.stcmcrtdt = cl_get_current()
      LET g_stcm_m.stcmmodid = g_user
      LET g_stcm_m.stcmmoddt = cl_get_current()
      LET g_stcm_m.stcmstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_stcm_m.stcmdocdt = g_today
   LET g_stcm_m.stcmcnfid = ""
   LET g_stcm_m.stcmcnfdt = ""
   #LET g_stcm_m.stcmsite = g_site #ken
   #ken----------------------s 需求單號：141208-00001 項次：21
   CALL s_aooi500_default(g_prog,'stcmsite',g_stcm_m.stcmsite)
      RETURNING l_insert,g_stcm_m.stcmsite
   IF l_insert = FALSE THEN
      RETURN
   END IF
   #ken----------------------e 需求單號：141208-00001 項次：21
   
   LET g_stcm_m.stcmunit = g_site
   #dongsz--add--str---
   #預設單據的單別
   LET r_success = ''
   LET r_doctype = ''
   CALL s_arti200_get_def_doc_type(g_stcm_m.stcmsite,g_prog,'1')
        RETURNING r_success,r_doctype
   LET g_stcm_m.stcmdocno = r_doctype
   #dongsz--add--end---
   LET g_stcm_m.stcm008 = g_user
   SELECT ooag003 INTO g_stcm_m.stcm009
     FROM ooag_t 
    WHERE ooagent = g_enterprise
      AND ooag001 = g_user    
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stcm_m.stcmstus 
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
   
   
   CALL astt602_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stcm_m.* TO NULL
      INITIALIZE g_stcn_d TO NULL
      INITIALIZE g_stcn2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt602_show()
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
   CALL astt602_set_act_visible()   
   CALL astt602_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stcment = " ||g_enterprise|| " AND",
                      " stcmdocno = '", g_stcm_m.stcmdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt602_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt602_idx_chk()
   
   LET g_data_owner = g_stcm_m.stcmownid      
   LET g_data_dept  = g_stcm_m.stcmowndp
   
   #功能已完成,通報訊息中心
   CALL astt602_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt602_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stcn_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE stco_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt602_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stcn_t
    WHERE stcnent = g_enterprise AND stcndocno = g_stcmdocno_t
 
    INTO TEMP astt602_detail
 
   #將key修正為調整後   
   UPDATE astt602_detail 
      #更新key欄位
      SET stcndocno = g_stcm_m.stcmdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stcn_t SELECT * FROM astt602_detail
   
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
   DROP TABLE astt602_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stco_t 
    WHERE stcoent = g_enterprise AND stcodocno = g_stcmdocno_t
 
    INTO TEMP astt602_detail
 
   #將key修正為調整後   
   UPDATE astt602_detail SET stcodocno = g_stcm_m.stcmdocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO stco_t SELECT * FROM astt602_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt602_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt602_delete()
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
   
   IF g_stcm_m.stcmdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt602_cl USING g_enterprise,g_stcm_m.stcmdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt602_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt602_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
       g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
       g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
       g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
       g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
       g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
       g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt602_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stcm_m_mask_o.* =  g_stcm_m.*
   CALL astt602_stcm_t_mask()
   LET g_stcm_m_mask_n.* =  g_stcm_m.*
   
   CALL astt602_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt602_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stcmdocno_t = g_stcm_m.stcmdocno
 
 
      DELETE FROM stcm_t
       WHERE stcment = g_enterprise AND stcmdocno = g_stcm_m.stcmdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stcm_m.stcmdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      #ken-----------------------s 需求單號：141208-00001 項次：21
      IF NOT s_aooi200_del_docno(g_stcm_m.stcmdocno,g_stcm_m.stcmdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #ken-----------------------e
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stcn_t
       WHERE stcnent = g_enterprise AND stcndocno = g_stcm_m.stcmdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcn_t:",SQLERRMESSAGE 
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
      DELETE FROM stco_t
       WHERE stcoent = g_enterprise AND
             stcodocno = g_stcm_m.stcmdocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stcm_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt602_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stcn_d.clear() 
      CALL g_stcn2_d.clear()       
 
     
      CALL astt602_ui_browser_refresh()  
      #CALL astt602_ui_headershow()  
      #CALL astt602_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt602_browser_fill("")
         CALL astt602_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt602_cl
 
   #功能已完成,通報訊息中心
   CALL astt602_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt602.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt602_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stcn_d.clear()
   CALL g_stcn2_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt602_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stcnseq,stcn001,stcn002,stcn003,stcn004,stcn005,stcn006,stcn007, 
             stcn008,stcn009,stcn010,stcn011,stcn012,stcn013,stcn014,stcn015,stcn016,stcn017,stcn018, 
             stcn019,stcnsite,stcnunit ,t1.stael003 FROM stcn_t",   
                     " INNER JOIN stcm_t ON stcment = " ||g_enterprise|| " AND stcmdocno = stcndocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN stael_t t1 ON t1.staelent="||g_enterprise||" AND t1.stael001=stcn001 AND t1.stael002='"||g_dlang||"' ",
 
                     " WHERE stcnent=? AND stcndocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stcn_t.stcnseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt602_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt602_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stcm_m.stcmdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stcm_m.stcmdocno INTO g_stcn_d[l_ac].stcnseq,g_stcn_d[l_ac].stcn001, 
          g_stcn_d[l_ac].stcn002,g_stcn_d[l_ac].stcn003,g_stcn_d[l_ac].stcn004,g_stcn_d[l_ac].stcn005, 
          g_stcn_d[l_ac].stcn006,g_stcn_d[l_ac].stcn007,g_stcn_d[l_ac].stcn008,g_stcn_d[l_ac].stcn009, 
          g_stcn_d[l_ac].stcn010,g_stcn_d[l_ac].stcn011,g_stcn_d[l_ac].stcn012,g_stcn_d[l_ac].stcn013, 
          g_stcn_d[l_ac].stcn014,g_stcn_d[l_ac].stcn015,g_stcn_d[l_ac].stcn016,g_stcn_d[l_ac].stcn017, 
          g_stcn_d[l_ac].stcn018,g_stcn_d[l_ac].stcn019,g_stcn_d[l_ac].stcnsite,g_stcn_d[l_ac].stcnunit, 
          g_stcn_d[l_ac].stcn001_desc   #(ver:78)
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
   IF astt602_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stcoseq,stco001,stco002,stcosite,stcounit ,t2.imaal003 ,t3.imaal004 FROM stco_t", 
                
                     " INNER JOIN  stcm_t ON stcment = " ||g_enterprise|| " AND stcmdocno = stcodocno ",
 
                     "",
                     
                                    " LEFT JOIN imaal_t t2 ON t2.imaalent="||g_enterprise||" AND t2.imaal001=stco001 AND t2.imaal002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=stco001 AND t3.imaal002='"||g_dlang||"' ",
 
                     " WHERE stcoent=? AND stcodocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stco_t.stcoseq"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt602_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR astt602_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_stcm_m.stcmdocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_stcm_m.stcmdocno INTO g_stcn2_d[l_ac].stcoseq,g_stcn2_d[l_ac].stco001, 
          g_stcn2_d[l_ac].stco002,g_stcn2_d[l_ac].stcosite,g_stcn2_d[l_ac].stcounit,g_stcn2_d[l_ac].stco001_desc, 
          g_stcn2_d[l_ac].stco001_desc_desc   #(ver:78)
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
   
   CALL g_stcn_d.deleteElement(g_stcn_d.getLength())
   CALL g_stcn2_d.deleteElement(g_stcn2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt602_pb
   FREE astt602_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stcn_d.getLength()
      LET g_stcn_d_mask_o[l_ac].* =  g_stcn_d[l_ac].*
      CALL astt602_stcn_t_mask()
      LET g_stcn_d_mask_n[l_ac].* =  g_stcn_d[l_ac].*
   END FOR
   
   LET g_stcn2_d_mask_o.* =  g_stcn2_d.*
   FOR l_ac = 1 TO g_stcn2_d.getLength()
      LET g_stcn2_d_mask_o[l_ac].* =  g_stcn2_d[l_ac].*
      CALL astt602_stco_t_mask()
      LET g_stcn2_d_mask_n[l_ac].* =  g_stcn2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt602_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stcn_t
       WHERE stcnent = g_enterprise AND
         stcndocno = ps_keys_bak[1] AND stcnseq = ps_keys_bak[2]
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
         CALL g_stcn_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM stco_t
       WHERE stcoent = g_enterprise AND
             stcodocno = ps_keys_bak[1] AND stcoseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stcn2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt602_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stcn_t
                  (stcnent,
                   stcndocno,
                   stcnseq
                   ,stcn001,stcn002,stcn003,stcn004,stcn005,stcn006,stcn007,stcn008,stcn009,stcn010,stcn011,stcn012,stcn013,stcn014,stcn015,stcn016,stcn017,stcn018,stcn019,stcnsite,stcnunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcn_d[g_detail_idx].stcn001,g_stcn_d[g_detail_idx].stcn002,g_stcn_d[g_detail_idx].stcn003, 
                       g_stcn_d[g_detail_idx].stcn004,g_stcn_d[g_detail_idx].stcn005,g_stcn_d[g_detail_idx].stcn006, 
                       g_stcn_d[g_detail_idx].stcn007,g_stcn_d[g_detail_idx].stcn008,g_stcn_d[g_detail_idx].stcn009, 
                       g_stcn_d[g_detail_idx].stcn010,g_stcn_d[g_detail_idx].stcn011,g_stcn_d[g_detail_idx].stcn012, 
                       g_stcn_d[g_detail_idx].stcn013,g_stcn_d[g_detail_idx].stcn014,g_stcn_d[g_detail_idx].stcn015, 
                       g_stcn_d[g_detail_idx].stcn016,g_stcn_d[g_detail_idx].stcn017,g_stcn_d[g_detail_idx].stcn018, 
                       g_stcn_d[g_detail_idx].stcn019,g_stcn_d[g_detail_idx].stcnsite,g_stcn_d[g_detail_idx].stcnunit) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stcn_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stcn_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO stco_t
                  (stcoent,
                   stcodocno,
                   stcoseq
                   ,stco001,stco002,stcosite,stcounit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcn2_d[g_detail_idx].stco001,g_stcn2_d[g_detail_idx].stco002,g_stcn2_d[g_detail_idx].stcosite, 
                       g_stcn2_d[g_detail_idx].stcounit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_stcn2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt602_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcn_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt602_stcn_t_mask_restore('restore_mask_o')
               
      UPDATE stcn_t 
         SET (stcndocno,
              stcnseq
              ,stcn001,stcn002,stcn003,stcn004,stcn005,stcn006,stcn007,stcn008,stcn009,stcn010,stcn011,stcn012,stcn013,stcn014,stcn015,stcn016,stcn017,stcn018,stcn019,stcnsite,stcnunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcn_d[g_detail_idx].stcn001,g_stcn_d[g_detail_idx].stcn002,g_stcn_d[g_detail_idx].stcn003, 
                  g_stcn_d[g_detail_idx].stcn004,g_stcn_d[g_detail_idx].stcn005,g_stcn_d[g_detail_idx].stcn006, 
                  g_stcn_d[g_detail_idx].stcn007,g_stcn_d[g_detail_idx].stcn008,g_stcn_d[g_detail_idx].stcn009, 
                  g_stcn_d[g_detail_idx].stcn010,g_stcn_d[g_detail_idx].stcn011,g_stcn_d[g_detail_idx].stcn012, 
                  g_stcn_d[g_detail_idx].stcn013,g_stcn_d[g_detail_idx].stcn014,g_stcn_d[g_detail_idx].stcn015, 
                  g_stcn_d[g_detail_idx].stcn016,g_stcn_d[g_detail_idx].stcn017,g_stcn_d[g_detail_idx].stcn018, 
                  g_stcn_d[g_detail_idx].stcn019,g_stcn_d[g_detail_idx].stcnsite,g_stcn_d[g_detail_idx].stcnunit)  
 
         WHERE stcnent = g_enterprise AND stcndocno = ps_keys_bak[1] AND stcnseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcn_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stcn_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt602_stcn_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stco_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL astt602_stco_t_mask_restore('restore_mask_o')
               
      UPDATE stco_t 
         SET (stcodocno,
              stcoseq
              ,stco001,stco002,stcosite,stcounit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcn2_d[g_detail_idx].stco001,g_stcn2_d[g_detail_idx].stco002,g_stcn2_d[g_detail_idx].stcosite, 
                  g_stcn2_d[g_detail_idx].stcounit) 
         WHERE stcoent = g_enterprise AND stcodocno = ps_keys_bak[1] AND stcoseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stco_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stco_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt602_stco_t_mask_restore('restore_mask_n')
 
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
 
{<section id="astt602.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt602_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt602.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt602_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt602.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt602_lock_b(ps_table,ps_page)
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
   #CALL astt602_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stcn_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt602_bcl USING g_enterprise,
                                       g_stcm_m.stcmdocno,g_stcn_d[g_detail_idx].stcnseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt602_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stco_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt602_bcl2 USING g_enterprise,
                                             g_stcm_m.stcmdocno,g_stcn2_d[g_detail_idx].stcoseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt602_bcl2:",SQLERRMESSAGE 
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
 
{<section id="astt602.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt602_unlock_b(ps_table,ps_page)
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
      CLOSE astt602_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt602_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt602_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stcmdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stcmdocno",TRUE)
      CALL cl_set_comp_entry("stcmdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      #ken-----------------------s 需求單號：141208-00001 項次：21
      CALL cl_set_comp_entry("stcmdocdt",TRUE)
      CALL cl_set_comp_entry("stcmsite",TRUE)
      #ken-----------------------e 需求單號：141208-00001 項次：21
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt602_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stcmdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stcmdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stcmdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #ken-----------------------s 需求單號：141208-00001 項次：21
   IF p_cmd = 'u' THEN
     CALL cl_set_comp_entry("stcmsite",FALSE)  
     CALL cl_set_comp_entry("stcmdocdt",FALSE)
     CALL cl_set_comp_entry("stcmdocno",FALSE)
   END IF
   IF NOT s_aooi500_comp_entry(g_prog,'stcmsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stcmsite",FALSE)
   END IF
   #ken-----------------------e 需求單號：141208-00001 項次：21
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt602.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt602_set_entry_b(p_cmd)
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
 
{<section id="astt602.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt602_set_no_entry_b(p_cmd)
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
 
{<section id="astt602.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt602_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt602.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt602_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stcm_m.stcmstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt602.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt602_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt602.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt602_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt602.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt602_default_search()
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
      LET ls_wc = ls_wc, " stcmdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stcm_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stcn_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stco_t" 
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
 
{<section id="astt602.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt602_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stcm_m.stcmdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt602_cl USING g_enterprise,g_stcm_m.stcmdocno
   IF STATUS THEN
      CLOSE astt602_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt602_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
       g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
       g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
       g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
       g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
       g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
       g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
       g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
       g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt602_action_chk() THEN
      CLOSE astt602_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno,g_stcm_m.stcmunit, 
       g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm003_desc,g_stcm_m.stcm004,g_stcm_m.stcm004_desc, 
       g_stcm_m.stcm002,g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm006_desc,g_stcm_m.stcm007,g_stcm_m.stcm007_desc, 
       g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm008_desc,g_stcm_m.stcm009,g_stcm_m.stcm009_desc, 
       g_stcm_m.stcm016,g_stcm_m.stcm016_desc,g_stcm_m.stcm017,g_stcm_m.stcm017_desc,g_stcm_m.next_b, 
       g_stcm_m.stcm010,g_stcm_m.stcm010_desc,g_stcm_m.stcm011,g_stcm_m.stcm011_desc,g_stcm_m.stcm012, 
       g_stcm_m.stcm012_desc,g_stcm_m.stcm018,g_stcm_m.num,g_stcm_m.stcm013,g_stcm_m.stcm013_desc,g_stcm_m.stcm014, 
       g_stcm_m.stcm014_desc,g_stcm_m.stcm015,g_stcm_m.stcm015_desc,g_stcm_m.stcm019,g_stcm_m.stcmownid, 
       g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtid_desc, 
       g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmodid_desc, 
       g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfid_desc,g_stcm_m.stcmcnfdt
 
   CASE g_stcm_m.stcmstus
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
         CASE g_stcm_m.stcmstus
            
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
      CALL cl_set_act_visible("open,invalid,valid,approved,withdraw,rejection,signing",TRUE)
      #ADD BY zhujing 2015-4-30----(S)
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      #ADD BY zhujing 2015-4-30----(E)
      CASE g_stcm_m.stcmstus
         WHEN "N"
            CALL cl_set_act_visible("open,approved,withdraw,rejection,signing",FALSE)
            #ADD BY zhujing 2015-4-30----(S)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)
            #ADD BY zhujing 2015-4-30----(E)
         WHEN "X"
            #HIDE OPTION "invalid"
            CALL cl_set_act_visible("void,invalid,approved,withdraw,rejection,signing",FALSE)
      
         WHEN "Y"
            #HIDE OPTION "confirmed"
            CALL cl_set_act_visible("void,invalid,approved,withdraw,rejection,signing",FALSE)
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt602_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt602_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt602_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt602_cl
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
      g_stcm_m.stcmstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt602_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #151125-00001#4 --- add start ---
   IF lc_state = 'X' THEN
      IF NOT cl_ask_confirm('aim-00109') THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
   END IF
   #151125-00001#4 --- add end   ---
   #end add-point
   
   LET g_stcm_m.stcmmodid = g_user
   LET g_stcm_m.stcmmoddt = cl_get_current()
   LET g_stcm_m.stcmstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stcm_t 
      SET (stcmstus,stcmmodid,stcmmoddt) 
        = (g_stcm_m.stcmstus,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt)     
    WHERE stcment = g_enterprise AND stcmdocno = g_stcm_m.stcmdocno
 
    
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
      EXECUTE astt602_master_referesh USING g_stcm_m.stcmdocno INTO g_stcm_m.stcmsite,g_stcm_m.stcmdocdt, 
          g_stcm_m.stcmdocno,g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm002, 
          g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm007,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm009, 
          g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,g_stcm_m.stcm011,g_stcm_m.stcm012,g_stcm_m.stcm018, 
          g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmowndp, 
          g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmoddt, 
          g_stcm_m.stcmcnfid,g_stcm_m.stcmcnfdt,g_stcm_m.stcmsite_desc,g_stcm_m.stcm003_desc,g_stcm_m.stcm004_desc, 
          g_stcm_m.stcm006_desc,g_stcm_m.stcm007_desc,g_stcm_m.stcm008_desc,g_stcm_m.stcm009_desc,g_stcm_m.stcm016_desc, 
          g_stcm_m.stcm010_desc,g_stcm_m.stcm011_desc,g_stcm_m.stcm012_desc,g_stcm_m.stcm013_desc,g_stcm_m.stcm014_desc, 
          g_stcm_m.stcm015_desc,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid_desc, 
          g_stcm_m.stcmcrtdp_desc,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stcm_m.stcmsite,g_stcm_m.stcmsite_desc,g_stcm_m.stcmdocdt,g_stcm_m.stcmdocno, 
          g_stcm_m.stcmunit,g_stcm_m.stcm001,g_stcm_m.stcm003,g_stcm_m.stcm003_desc,g_stcm_m.stcm004, 
          g_stcm_m.stcm004_desc,g_stcm_m.stcm002,g_stcm_m.stcm005,g_stcm_m.stcm006,g_stcm_m.stcm006_desc, 
          g_stcm_m.stcm007,g_stcm_m.stcm007_desc,g_stcm_m.stcmstus,g_stcm_m.stcm008,g_stcm_m.stcm008_desc, 
          g_stcm_m.stcm009,g_stcm_m.stcm009_desc,g_stcm_m.stcm016,g_stcm_m.stcm016_desc,g_stcm_m.stcm017, 
          g_stcm_m.stcm017_desc,g_stcm_m.next_b,g_stcm_m.stcm010,g_stcm_m.stcm010_desc,g_stcm_m.stcm011, 
          g_stcm_m.stcm011_desc,g_stcm_m.stcm012,g_stcm_m.stcm012_desc,g_stcm_m.stcm018,g_stcm_m.num, 
          g_stcm_m.stcm013,g_stcm_m.stcm013_desc,g_stcm_m.stcm014,g_stcm_m.stcm014_desc,g_stcm_m.stcm015, 
          g_stcm_m.stcm015_desc,g_stcm_m.stcm019,g_stcm_m.stcmownid,g_stcm_m.stcmownid_desc,g_stcm_m.stcmowndp, 
          g_stcm_m.stcmowndp_desc,g_stcm_m.stcmcrtid,g_stcm_m.stcmcrtid_desc,g_stcm_m.stcmcrtdp,g_stcm_m.stcmcrtdp_desc, 
          g_stcm_m.stcmcrtdt,g_stcm_m.stcmmodid,g_stcm_m.stcmmodid_desc,g_stcm_m.stcmmoddt,g_stcm_m.stcmcnfid, 
          g_stcm_m.stcmcnfid_desc,g_stcm_m.stcmcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_stcm_m.stcmstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt602_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt602_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt602.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt602_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stcn_d.getLength() THEN
         LET g_detail_idx = g_stcn_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcn_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcn_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stcn2_d.getLength() THEN
         LET g_detail_idx = g_stcn2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcn2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcn2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt602_b_fill2(pi_idx)
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
   
   CALL astt602_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt602_fill_chk(ps_idx)
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
 
{<section id="astt602.status_show" >}
PRIVATE FUNCTION astt602_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt602.mask_functions" >}
&include "erp/ast/astt602_mask.4gl"
 
{</section>}
 
{<section id="astt602.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt602_send()
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
 
 
   CALL astt602_show()
   CALL astt602_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   #ADD BY zhujing 2015-4-30---(S)
   CALL s_astt602_conf_chk(g_stcm_m.stcmdocno,g_stcm_m.stcmstus) RETURNING l_success,g_errno
   IF NOT l_success THEN
      CLOSE astt602_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #ADD BY zhujing 2015-4-30---(E)
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stcm_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stcn_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_stcn2_d))
 
 
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
   #CALL astt602_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt602_ui_headershow()
   CALL astt602_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt602_draw_out()
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
   CALL astt602_ui_headershow()  
   CALL astt602_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt602.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt602_set_pk_array()
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
   LET g_pk_array[1].values = g_stcm_m.stcmdocno
   LET g_pk_array[1].column = 'stcmdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt602.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt602.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt602_msgcentre_notify(lc_state)
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
   CALL astt602_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stcm_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt602.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt602_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stcmstus  INTO g_stcm_m.stcmstus
     FROM stcm_t
    WHERE stcment = g_enterprise
      AND stcmdocno = g_stcm_m.stcmdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stcm_m.stcmstus
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
        LET g_errparam.extend = g_stcm_m.stcmdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt602_set_act_visible()
        CALL astt602_set_act_no_visible()
        CALL astt602_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt602.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 合约编号检查
# Memo...........:
# Usage..........: CALL astt602_stcm001_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm001_chk()
   DEFINE l_stcestus   LIKE stce_t.stcestus
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stce010    LIKE stce_t.stce010
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   
   LET g_errno = ''
   SELECT stcestus,stce009,stce010,stce005,stce006,stce007,stce008,stce017,stce018,stce021,stce022,stce024
     INTO l_stcestus,l_stce009,l_stce010,l_stce005,l_stce006,l_stce007,l_stce008,l_stce017,l_stce018,l_stce021,l_stce022,l_stce024
     FROM stce_t
    WHERE stceent = g_enterprise
      AND stce001 = g_stcm_m.stcm001
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00051'
      WHEN l_stcestus <> 'Y'   LET g_errno = 'ast-00052'
      WHEN l_stce017 > g_stcm_m.stcmdocdt OR l_stce018 < g_stcm_m.stcmdocdt
                               LET g_errno = 'ast-00055'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      LET g_stcm_m.stcm003 = l_stce009
      LET g_stcm_m.stcm004 = l_stce010
      LET g_stcm_m.stcm005 = l_stce005
      LET g_stcm_m.stcm006 = l_stce006
      LET g_stcm_m.stcm007 = l_stce007
      LET g_stcm_m.stcm002 = l_stce008
      LET g_stcm_m.stcm018 = l_stce017
      LET g_stcm_m.stcm019 = l_stce018
      LET g_stcm_m.stcm016 = l_stce021
      LET g_stcm_m.stcm017 = l_stce022
      LET g_stcm_m.stcm010 = l_stce024
      DISPLAY BY NAME g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm005,g_stcm_m.stcm006,
                      g_stcm_m.stcm007,g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,
                      g_stcm_m.stcm018,g_stcm_m.stcm019
                      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm003
      CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm003_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm004
      CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm004_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm006
      CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm006_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm006_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm007
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm007_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm007_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm016
      CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm016_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm016_desc
      
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_stcm_m.stcmsite                  
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm017
      CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm017_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm010
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm010_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm010_desc
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 经销商检查
# Memo...........:
# Usage..........: astt602_stcm003_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm003_chk()
   DEFINE l_pmaastus   LIKE pmaa_t.pmaastus
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce001    LIKE stce_t.stce001
   DEFINE l_stce010    LIKE stce_t.stce010
   DEFINE l_stcw004    LIKE stcw_t.stcw004
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   DEFINE l_n          LIKE type_t.num5
   
   LET g_errno = ''
   SELECT pmaastus INTO l_pmaastus
     FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa230 = '1' 
      AND pmaa092 = '2' 
      AND pmaa002 <> '1'
      AND pmaa001 = g_stcm_m.stcm003
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00053'
      WHEN l_pmaastus <> 'Y'   LET g_errno = 'ast-00054'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN
      IF NOT cl_null(g_stcm_m.stcm001) THEN
         LET l_n = 0
         #检查经销商是否存在合同中      
         SELECT COUNT(*) INTO l_n
           FROM stce_t         
          WHERE stceent = g_enterprise
            AND stce001 = g_stcm_m.stcm001
            AND stce009 = g_stcm_m.stcm003
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00056'
         END IF 
      ELSE
         IF NOT cl_null(g_stcm_m.stcmdocdt) THEN 
            #带出符合条件的合约编号及其他栏位
            SELECT stce001,stce010,stce005,stce006,stce007,stce008,stce021,stce022,stce024,stce017,stce018
              INTO l_stce001,l_stce010,l_stce005,l_stce006,l_stce007,l_stce008,l_stce021,l_stce022,l_stce024,l_stce017,l_stce018
              FROM stce_t
             WHERE stceent = g_enterprise
               AND stce009 = g_stcm_m.stcm003
               AND stce010 = g_stcm_m.stcm004
               AND stce017 <= g_stcm_m.stcmdocdt
               AND stce018 >= g_stcm_m.stcmdocdt
               AND stcestus = 'Y'
            IF NOT cl_null(l_stce001) THEN    
               LET g_stcm_m.stcm001 = l_stce001
               LET g_stcm_m.stcm004 = l_stce010
               LET g_stcm_m.stcm005 = l_stce005
               LET g_stcm_m.stcm006 = l_stce006
               LET g_stcm_m.stcm007 = l_stce007
               LET g_stcm_m.stcm002 = l_stce008
               LET g_stcm_m.stcm018 = l_stce017
               LET g_stcm_m.stcm019 = l_stce018
               LET g_stcm_m.stcm016 = l_stce021
               LET g_stcm_m.stcm017 = l_stce022
               LET g_stcm_m.stcm010 = l_stce024               
               DISPLAY BY NAME g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm005,g_stcm_m.stcm006,
                               g_stcm_m.stcm007,g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,
                               g_stcm_m.stcm018,g_stcm_m.stcm019

               LET l_stcw004 = ''
               SELECT stcw004 INTO l_stcw004
                 FROM stcw_t
                WHERE stcw001 = g_stcm_m.stcm001
                  AND stcw005 = 'N'
                  AND stcwent=g_enterprise  #160905-00007#17 add
                ORDER BY stcwseq       
               DISPLAY l_stcw004 TO next_b   
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm003
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm003_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm004
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm004_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm006
               CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm006_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm006_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm007
               CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm007_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm007_desc             

               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm016
               CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm016_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm016_desc
               
               SELECT ooef019 INTO l_ooef019
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_stcm_m.stcmsite                  
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm017
               CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm017_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm010_desc
            END IF
         END IF 
      END IF          
   END IF 
END FUNCTION
# Descriptions...: 网点检查
# Memo...........:
# Usage..........: astt602_stcm004_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
PRIVATE FUNCTION astt602_stcm004_chk()
   DEFINE l_pmaastus   LIKE pmaa_t.pmaastus
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce001    LIKE stce_t.stce001
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stcw004    LIKE stcw_t.stcw004
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019   
   DEFINE l_n          LIKE type_t.num5
   
   LET g_errno = ''
   #网点编号存在
   IF NOT cl_null(g_stcm_m.stcm003) THEN
      LET l_n = 0      
      SELECT COUNT(*) INTO l_n 
        FROM pmaa_t 
       WHERE pmaaent = g_enterprise 
         AND pmaa006 = g_stcm_m.stcm003 
         AND pmaa001 = g_stcm_m.stcm004
      IF l_n =0 THEN
        LET g_errno = 'ast-00043'
        RETURN 
      END IF
   END IF 
   IF cl_null(g_errno) THEN
      IF NOT cl_null(g_stcm_m.stcm001) THEN
         LET l_n = 0
         #检查网点是否存在合同中      
         SELECT COUNT(*) INTO l_n
           FROM stce_t         
          WHERE stceent = g_enterprise
            AND stce001 = g_stcm_m.stcm001
            AND stce010 = g_stcm_m.stcm004
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00057'
         END IF 
      ELSE
         IF NOT cl_null(g_stcm_m.stcmdocdt) AND NOT cl_null(g_stcm_m.stcm003) THEN 
            #带出符合条件的合约编号及其他栏位
            SELECT stce001,stce009,stce005,stce006,stce007,stce008,stce021,stce022,stce024,stce017,stce018
              INTO l_stce001,l_stce009,l_stce005,l_stce006,l_stce007,l_stce008,l_stce021,l_stce022,l_stce024,l_stce017,l_stce018
              FROM stce_t
             WHERE stceent = g_enterprise
               AND stce010 = g_stcm_m.stcm004
               AND stce009 = g_stcm_m.stcm003
               AND stce017 <= g_stcm_m.stcmdocdt
               AND stce018 >= g_stcm_m.stcmdocdt
               AND stcestus = 'Y'
            IF NOT cl_null(l_stce001) THEN    
               LET g_stcm_m.stcm001 = l_stce001
               LET g_stcm_m.stcm003 = l_stce009
               LET g_stcm_m.stcm005 = l_stce005
               LET g_stcm_m.stcm006 = l_stce006
               LET g_stcm_m.stcm007 = l_stce007
               LET g_stcm_m.stcm002 = l_stce008
               LET g_stcm_m.stcm018 = l_stce017
               LET g_stcm_m.stcm019 = l_stce018
               LET g_stcm_m.stcm016 = l_stce021
               LET g_stcm_m.stcm017 = l_stce022
               LET g_stcm_m.stcm010 = l_stce024
               DISPLAY BY NAME g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm005,g_stcm_m.stcm006,
                               g_stcm_m.stcm007,g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,
                               g_stcm_m.stcm018,g_stcm_m.stcm019
                               
               LET l_stcw004 = ''
               SELECT stcw004 INTO l_stcw004
                 FROM stcw_t
                WHERE stcw001 = g_stcm_m.stcm001
                  AND stcw005 = 'N'
                  AND stcwent=g_enterprise  #160905-00007#17 add
                ORDER BY stcwseq       
               DISPLAY l_stcw004 TO next_b   
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm003
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm003_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm004
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm004_desc

               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm006
               CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm006_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm006_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm007
               CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm007_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm007_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm016
               CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm016_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm016_desc
               
               SELECT ooef019 INTO l_ooef019
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_stcm_m.stcmsite                
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm017
               CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm017_desc
               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_stcm_m.stcm010
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_stcm_m.stcm010_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_stcm_m.stcm010_desc
            END IF
         END IF 
      END IF          
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt602_stcmdocdt_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcmdocdt_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stcm_m.stcm001) THEN 
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM stce_t
       WHERE stceent = g_enterprise
         AND stce001 = g_stcm_m.stcm001
         AND stce017 <= g_stcm_m.stcmdocdt
         AND stce018 >= g_stcm_m.stcmdocdt
         AND stcestus = 'Y'
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00055'
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 谈判人员检查
# Memo...........:
# Usage..........: astt602_stcm008_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm008_chk()
DEFINE l_ooag003   LIKE ooag_t.ooag003
DEFINE l_ooagstus  LIKE ooag_t.ooagstus

   LET g_errno = ''
   SELECT ooag003,ooagstus INTO l_ooag003,l_ooagstus
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = g_stcm_m.stcm008
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'aim-00069'
      WHEN l_ooagstus <> 'Y'   LET g_errno = 'ais-00018'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      LET g_stcm_m.stcm009 = l_ooag003
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm009
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm009_desc = '', g_rtn_fields[1] , ''
   ELSE
      LET g_stcm_m.stcm009 = ''  
      LET g_stcm_m.stcm009_desc = ''
   END IF
   DISPLAY BY NAME g_stcm_m.stcm009,g_stcm_m.stcm009_desc
END FUNCTION

################################################################################
# Descriptions...: 部门检查
# Memo...........:
# Usage..........: 
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm009_chk()
DEFINE l_ooegstus  LIKE ooag_t.ooagstus
DEFINE l_n         LIKE type_t.num5

   LET g_errno = ''
   SELECT ooegstus INTO l_ooegstus
     FROM ooeg_t
    WHERE ooegent = g_enterprise
      AND ooeg001 = g_stcm_m.stcm009
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00352'
      WHEN l_ooegstus <> 'Y'   LET g_errno = 'art-00353'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      IF NOT cl_null(g_stcm_m.stcm008) THEN
         LET l_n = 0      
         SELECT COUNT(*) INTO l_n
           FROM ooag_t
          WHERE ooagent = g_enterprise
            AND ooag001 = g_stcm_m.stcm008 
            AND ooag003 = g_stcm_m.stcm009
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00058'
         END IF 
      END IF 
   END IF
END FUNCTION

################################################################################
# Descriptions...: 币别检查
# Memo...........:
# Usage..........: 无
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm016_chk()
DEFINE l_ooajstus   LIKE ooaj_t.ooajstus

   LET g_errno = ''
   SELECT ooajstus INTO l_ooajstus
     FROM ooaj_t,ooef_t
    WHERE ooajent = ooefent
      AND ooaj001 = ooef014
      AND ooefent = g_enterprise
      AND ooef001 = g_stcm_m.stcmsite
      AND ooaj002 = g_stcm_m.stcm016
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00237'
      WHEN l_ooajstus <> 'Y'   LET g_errno = 'art-00238'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 检查税种
# Memo...........:
# Usage..........: 无
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm017_chk()
DEFINE l_oodbstus   LIKE oodb_t.oodbstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodbstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise
      AND ooef019 = oodb001
      AND ooefent = oodbent
      AND oodb002 = g_stcm_m.stcm017
      AND ooef001 = g_stcm_m.stcmsite
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'amm-00419'
      WHEN l_oodbstus <> 'Y'   LET g_errno = 'amm-00420'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE

END FUNCTION

################################################################################
# Descriptions...: 销售范围检查
# Memo...........:
# Usage..........: CALL astt602_stcm012_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm012_chk()
   DEFINE l_dbbcstus   LIKE dbbc_t.dbbcstus
   DEFINE l_dbbc003    LIKE dbbc_t.dbbc003
   DEFINE l_dbbc004    LIKE dbbc_t.dbbc004
   DEFINE l_dbbc005    LIKE dbbc_t.dbbc005
   DEFINE l_dbbc002    LIKE dbbc_t.dbbc002
   
   LET g_errno = ''
   IF NOT cl_null(g_stcm_m.stcm011) THEN 
      SELECT dbbcstus,dbbc003,dbbc004,dbbc005
        INTO l_dbbcstus,l_dbbc003,l_dbbc004,l_dbbc005
        FROM dbbc_t
       WHERE dbbcent = g_enterprise
         AND dbbc001 = g_stcm_m.stcm012
         AND dbbc002 = g_stcm_m.stcm011
      CASE 
         WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00061'
         WHEN l_dbbcstus <> 'Y'   LET g_errno = 'ast-00062'
         OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE              
   ELSE
      SELECT dbbcstus,dbbc002,dbbc003,dbbc004,dbbc005
        INTO l_dbbcstus,l_dbbc002,l_dbbc003,l_dbbc004,l_dbbc005
        FROM dbbc_t
       WHERE dbbcent = g_enterprise
         AND dbbc001 = g_stcm_m.stcm012
      CASE 
         WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00059'
         WHEN l_dbbcstus <> 'Y'   LET g_errno = 'ast-00060'
         OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE
   END IF 
   IF cl_null(g_errno) THEN 
      LET g_stcm_m.stcm013 = l_dbbc003
      LET g_stcm_m.stcm014 = l_dbbc004
      LET g_stcm_m.stcm015 = l_dbbc005
      IF cl_null(g_stcm_m.stcm011) THEN 
         LET g_stcm_m.stcm011 = l_dbbc002
      END IF 
      DISPLAY BY NAME g_stcm_m.stcm011,g_stcm_m.stcm013,g_stcm_m.stcm014,g_stcm_m.stcm015
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm011
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm011_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm011_desc
            
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm013
      CALL ap_ref_array2(g_ref_fields,"SELECT oojdl003 FROM oojdl_t WHERE oojdlent='"||g_enterprise||"' AND oojdl001=? AND oojdl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm013_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm013_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm014
      CALL ap_ref_array2(g_ref_fields,"SELECT dbbal003 FROM dbbal_t WHERE dbbalent='"||g_enterprise||"' AND dbbal001=? AND dbbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm014_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm014_desc

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcm_m.stcm015
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcm_m.stcm015_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stcm_m.stcm015_desc
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 销售组织检查
# Memo...........:
# Usage..........: astt602_stcm011_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm011_chk()
   DEFINE l_dbbcstus   LIKE dbbc_t.dbbcstus
   
   LET g_errno = ''
   IF NOT cl_null(g_stcm_m.stcm012) THEN 
      SELECT dbbcstus
        INTO l_dbbcstus
        FROM dbbc_t
       WHERE dbbcent = g_enterprise
         AND dbbc001 = g_stcm_m.stcm012
         AND dbbc002 = g_stcm_m.stcm011
      CASE 
         WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00061'
         WHEN l_dbbcstus <> 'Y'   LET g_errno = 'ast-00062'
         OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
      END CASE
   END IF 

END FUNCTION

################################################################################
# Descriptions...: 开始结束日期检查
# Memo...........:
# Usage..........: astt602_stcm018_stcm019_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm018_stcm019_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stcm_m.stcm018) AND NOT cl_null(g_stcm_m.stcm019) THEN 
      IF g_stcm_m.stcm018 > g_stcm_m.stcm019 THEN 
         LET g_errno = 'ast-00063'
         RETURN 
      END IF 
      IF NOT cl_null(g_stcm_m.stcm001) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stcm_m.stcm001
            AND stce017 <= g_stcm_m.stcm018
            AND stce018 >= g_stcm_m.stcm019
            AND stceent=g_enterprise #160905-00007#17 add
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF       
      LET l_n = 0
      #检查单身日期是否都在单头日期范围内
      SELECT COUNT(*) INTO l_n
        FROM stcn_t
       WHERE stcnent = g_enterprise
         AND stcndocno = g_stcm_m.stcmdocno
         AND (stcn005 < g_stcm_m.stcm018 
          OR stcn005 > g_stcm_m.stcm019)
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00064'
      END IF 
   END IF   
   IF NOT cl_null(g_stcm_m.stcm018) AND cl_null(g_stcm_m.stcm019) THEN  
      IF NOT cl_null(g_stcm_m.stcm001) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stcm_m.stcm001
            AND stce017 <= g_stcm_m.stcm018
            AND stce018 >= g_stcm_m.stcm018
            AND stceent=g_enterprise #160905-00007#17 add
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF      
      LET l_n = 0
      #检查单身日期是否都在单头日期范围内
      SELECT COUNT(*) INTO l_n
        FROM stcn_t
       WHERE stcnent = g_enterprise
         AND stcndocno = g_stcm_m.stcmdocno
         AND stcn005 < g_stcm_m.stcm018
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00065'
      END IF 
   END IF
   IF NOT cl_null(g_stcm_m.stcm019) AND cl_null(g_stcm_m.stcm018) THEN  
      IF NOT cl_null(g_stcm_m.stcm001) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stcm_m.stcm001
            AND stce017 <= g_stcm_m.stcm019
            AND stce018 >= g_stcm_m.stcm019
            AND stceent = g_enterprise  #160905-00007#17 add
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF  
      LET l_n = 0
      #检查单身日期是否都在单头日期范围内
      SELECT COUNT(*) INTO l_n
        FROM stcn_t
       WHERE stcnent = g_enterprise
         AND stcndocno = g_stcm_m.stcmdocno
         AND stcn005 > g_stcm_m.stcm019
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00066'
      END IF 
   END IF   
END FUNCTION

################################################################################
# Descriptions...: 费用编号检查
# Memo...........:
# Usage..........: astt602_stcn001_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcn001_chk()
   DEFINE l_staestus LIKE stae_t.staestus
   DEFINE l_stae002  LIKE stae_t.stae002
   DEFINE l_stae006  LIKE stae_t.stae006
   
   LET g_errno = ''
   SELECT staestus,stae002,stae006
     INTO l_staestus,l_stae002,l_stae006
     FROM stae_t
    WHERE stae001 = g_stcn_d[l_ac].stcn001 
      AND staeent = g_enterprise
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00001'
      WHEN l_staestus <> 'Y'   LET g_errno = 'ast-00002'
      WHEN l_stae002 <> '2'     LET g_errno = 'ast-00100'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE     
   IF cl_null(g_errno) THEN 
      IF l_stae006 = '3' THEN 
         CALL cl_set_comp_entry('stcn004',TRUE)
      ELSE
         LET g_stcn_d[l_ac].stcn004 = l_stae006
         CALL cl_set_comp_entry('stcn004',FALSE)
      END IF 
   END IF
END FUNCTION

################################################################################
# Descriptions...: 生效日期检查
# Memo...........:
# Usage..........: astt602_stcn005_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcn005_chk()

   LET g_errno = ''
   IF g_stcn_d[l_ac].stcn005 > g_stcm_m.stcm019 
   OR g_stcn_d[l_ac].stcn005 < g_stcm_m.stcm018 THEN 
      LET g_errno = 'ast-00064'
   END IF 
   
END FUNCTION

################################################################################
# Descriptions...: 产品检查
# Memo...........:
# Usage..........: astt602_stco001_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stco001_chk()
   DEFINE l_imaastus   LIKE imaa_t.imaastus
   DEFINE l_n          LIKE type_t.num5
   DEFINE l_sql        STRING 
   DEFINE l_stcm004    LIKE stcm_t.stcm004
   
   LET g_errno = ''
   SELECT imaastus INTO l_imaastus
     FROM imaa_t
    WHERE imaa001 = g_stcn2_d[l_ac].stco001
      AND imaaent = g_enterprise
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00016'
      WHEN l_imaastus <> 'Y'   LET g_errno = 'art-00126'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE  
   IF cl_null(g_errno) THEN 
      LET l_n = 0
      #判断产品是否在合约销售范围内
      LET l_sql = " SELECT COUNT(*) ",
                  "   FROM imaa_t ",
                  "  WHERE imaaent = '",g_enterprise,"'",
                  "    AND imaa001 = '",g_stcn2_d[l_ac].stco001,"'",
                  "    AND imaa009 IN (SELECT DISTINCT rtax001 ",
                  "                      FROM rtax_t ",
                  "                     WHERE rtax005 = 0 ",
                  "                     START WITH rtax003 IN(SELECT stch002 FROM stch_t WHERE stchent='",g_enterprise,"' AND stch001 = '",g_stcm_m.stcm001,"') ", #160905-00007#17
                  "                    CONNECT BY nocycle PRIOR rtax001 = rtax003",
                  "                    UNION",
                  "                    SELECT rtax001",
                  "                      FROM rtax_t,stch_t",
                  "                     WHERE rtax001 = stch002",
                  "                       AND rtax005 = 0 ",
                  "                       AND stch001 = '",g_stcm_m.stcm001,"')"
      PREPARE sel_cn FROM l_sql
      EXECUTE sel_cn INTO l_n
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00088'
      END IF 
   END IF 
   IF cl_null(g_errno) THEN 
      LET l_n = 0
      IF cl_null(g_stcm_m.stcm004) THEN 
         LET l_stcm004 = ' '
      ELSE
         LET l_stcm004 = g_stcm_m.stcm004
      END IF 
      #检查商品是否存在stcp_t结存档中
      SELECT COUNT(*) INTO l_n
        FROM stcp_t
       WHERE stcp005 = g_stcn2_d[l_ac].stco001
         AND stcpsite = g_stcm_m.stcmsite
         AND stcp001 = g_stcm_m.stcm002
         AND stcp002 = g_stcm_m.stcm003
         AND stcp003 = l_stcm004
         AND stcp004 = g_stcm_m.stcm005
         AND stcpent = g_enterprise
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00068'
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 费用编号+生效日期检查
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
PRIVATE FUNCTION astt602_stcn001_stcn005_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   LET l_n = 0
   SELECT COUNT(*) INTO l_n 
     FROM stcn_t
    WHERE stcnent = g_enterprise
      AND stcn001 = g_stcn_d[l_ac].stcn001
      AND stcn005 = g_stcn_d[l_ac].stcn005
      AND stcndocno = g_stcm_m.stcmdocno
   IF l_n > 0 THEN
      LET g_errno = 'ast-00070'
   END IF 
   
END FUNCTION

################################################################################
# Descriptions...: 检查单身产品是否存在合约经营范围内
# Memo...........:
# Usage..........: CALL astt602_stcm001_b()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/24 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm001_b()
   DEFINE l_n   LIKE type_t.num5
   DEFINE l_sql STRING 
   
   LET l_n = 0
   LET g_errno = ''
   SELECT COUNT(*) INTO l_n
     FROM stco_t
    WHERE stcodocno = g_stcm_m.stcmdocno
       AND stcoent=g_enterprise #160905-00007#17 add
   IF l_n > 0 THEN 
      LET l_n = 0
      #判断产品是否在合约销售范围内
      LET l_sql = " SELECT COUNT(*) ",
                  "   FROM stch_t,stco_t,imaa_t ",
                  "  WHERE stchent = imaaent",
                  "    AND imaaent = stcoent",
                  "    AND stcoent = '",g_enterprise,"'",
                  "    AND imaa001 = stco001",
                  "    AND stcodocno = '",g_stcm_m.stcmdocno,"'",
                  "    AND imaa009 NOT IN (SELECT DISTINCT rtax001 ",
                  "                      FROM rtax_t,stch_t ",
                  "                     WHERE rtax005 = 0 ",
                  "                       AND stch001 = '",g_stcm_m.stcm001,"'",
                  "                     START WITH rtax003 = stch002 ",
                  "                    CONNECT BY nocycle PRIOR rtax001 = rtax003",
                  "                    UNION",
                  "                    SELECT rtax001",
                  "                      FROM rtax_t,stch_t",
                  "                     WHERE rtax001 = stch002",
                  "                       AND stch001 = '",g_stcm_m.stcm001,"')",
                  "    AND stch001 = '",g_stcm_m.stcm001,"'"
      PREPARE sel_cn1 FROM l_sql
      EXECUTE sel_cn1 INTO l_n
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00088'
      END IF 
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 经销商为空检查
# Memo...........:
# Usage..........: CALL astt603_stcm003_null_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm003_null_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stcm_m.stcm001) THEN
      LET l_n = 0
      #检查经销商是否存在合同中      
      SELECT COUNT(*) INTO l_n
        FROM stce_t         
       WHERE stceent = g_enterprise
         AND stce001 = g_stcm_m.stcm001
         AND stce009 IS NULL
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00089'
      END IF
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 网点编号为空检查
# Memo...........:
# Usage..........: CALL astt603_stcm004_null_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/06/25 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt602_stcm004_null_chk()
   DEFINE l_n   LIKE type_t.num5
   DEFINE l_stce005    LIKE stce_t.stce005
   DEFINE l_stce006    LIKE stce_t.stce006
   DEFINE l_stce007    LIKE stce_t.stce007
   DEFINE l_stce008    LIKE stce_t.stce008
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stce001    LIKE stce_t.stce001
   DEFINE l_stce010    LIKE stce_t.stce010
   DEFINE l_stcw004    LIKE stcw_t.stcw004
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_stce024    LIKE stce_t.stce024
   DEFINE l_ooef019    LIKE ooef_t.ooef019
      
   LET g_errno = ''
   IF NOT cl_null(g_stcm_m.stcm001) THEN
      LET l_n = 0
      #检查经销商是否存在合同中      
      SELECT COUNT(*) INTO l_n
        FROM stce_t         
       WHERE stceent = g_enterprise
         AND stce001 = g_stcm_m.stcm001
         AND stce009 = g_stcm_m.stcm003
         AND stce010 IS NULL
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00090'
      END IF
   ELSE
      IF NOT cl_null(g_stcm_m.stcm003) THEN 
          #带出符合条件的合约编号及其他栏位
          SELECT stce001,stce009,stce005,stce006,stce007,stce008,stce021,stce022,stce024,stce017,stce018
            INTO l_stce001,l_stce009,l_stce005,l_stce006,l_stce007,l_stce008,l_stce021,l_stce022,l_stce024,l_stce017,l_stce018
            FROM stce_t
           WHERE stceent = g_enterprise
             AND stce010 IS NULL
             AND stce009 = g_stcm_m.stcm003
             AND stce017 <= g_stcm_m.stcmdocdt
             AND stce018 >= g_stcm_m.stcmdocdt
             AND stcestus = 'Y'
          IF NOT cl_null(l_stce001) THEN    
             LET g_stcm_m.stcm001 = l_stce001
             LET g_stcm_m.stcm003 = l_stce009
             LET g_stcm_m.stcm005 = l_stce005
             LET g_stcm_m.stcm006 = l_stce006
             LET g_stcm_m.stcm007 = l_stce007
             LET g_stcm_m.stcm002 = l_stce008
             LET g_stcm_m.stcm018 = l_stce017
             LET g_stcm_m.stcm019 = l_stce018
             LET g_stcm_m.stcm016 = l_stce021
             LET g_stcm_m.stcm017 = l_stce022
             LET g_stcm_m.stcm010 = l_stce024
             DISPLAY BY NAME g_stcm_m.stcm003,g_stcm_m.stcm004,g_stcm_m.stcm005,g_stcm_m.stcm006,
                             g_stcm_m.stcm007,g_stcm_m.stcm016,g_stcm_m.stcm017,g_stcm_m.stcm010,
                             g_stcm_m.stcm018,g_stcm_m.stcm019
                             
             LET l_stcw004 = ''
             SELECT stcw004 INTO l_stcw004
               FROM stcw_t
              WHERE stcw001 = g_stcm_m.stcm001
                AND stcw005 = 'N'
                AND stcwent=g_enterprise  #160905-00007#17 add
              ORDER BY stcwseq       
             DISPLAY l_stcw004 TO next_b   
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm003
             CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm003_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm003_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm004
             CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm004_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm004_desc

             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm006
             CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm006_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm006_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm007
             CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm007_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm007_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm016
             CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm016_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm016_desc
             
             SELECT ooef019 INTO l_ooef019
               FROM ooef_t
              WHERE ooefent = g_enterprise
                AND ooef001 = g_stcm_m.stcmsite                
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm017
             CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm017_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm017_desc
             
             INITIALIZE g_ref_fields TO NULL
             LET g_ref_fields[1] = g_stcm_m.stcm010
             CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
             LET g_stcm_m.stcm010_desc = '', g_rtn_fields[1] , ''
             DISPLAY BY NAME g_stcm_m.stcm010_desc
          END IF
      END IF 
   END IF 
END FUNCTION

 
{</section>}
 
