#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt310.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0020(2016-12-21 14:25:55), PR版次:0020(2017-01-24 15:39:07)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000516
#+ Filename...: asrt310
#+ Description: 重覆性生產發料維護作業
#+ Creator....: 02482(2013-11-19 17:34:08)
#+ Modifier...: 02295 -SD/PR- 08993
 
{</section>}
 
{<section id="asrt310.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#151125-00001#4   2015/11/25 By 06948   增加作廢時詢問「是否作廢」
#151224-00025#4   2015/12/28 By yihsuan 手動輸入特徵碼同步新增inam_t[料件產品特徵明細檔]
#150826-00008#3   2016/03/07 By xianghui 判断下标时，先抓取当前光标在所在行数
#160202-00010#1   2016/03/08 By xianghui 发料需求单身增加产品特征栏位的检查与开窗
#160314-00008#1   2016/03/14 By catmoon 批/序號3:不控管時,修改儲位/批號時沒有更新到inao_t
#160316-00007#7   2016/03/18 By xianghui 库存管理特征处增加制造批序号处理
#160304-00022#1   2016/03/23 By xianghui 库储批开窗时如果产品特征有值需过滤产品特征
#160318-00005#44  2016/03/26 By pengxin    修正azzi920重复定义之错误讯息
#160314-00009#14  2016/03/29 By xujing  产品特征自动开窗增加参数判断
#160318-00025#22  2016/04/21 BY 07900   校验代码重复错误讯息的修改
#160705-00042#10  2016/07/13 By sakura  程式中寫死g_prog部分改寫MATCHES方式
#160816-00001#10  2016/08/17 By 08742     抓取理由碼改CALL sub
#160818-00017#37  2016/08/29 By lixh   单据类作业修改，删除时需重新检查状态
#160905-00007#15  2016/09/05 by 08172 调整系统中无ENT的SQL条件增加ent
#161006-00018#13  2016/11/14 By 02295  增加D-MFG-0085参数，当其为Y时，如果申请资料有指定库储批，则实际出入库的库储批不可修改
#161124-00048#21  2016/12/13  By xujing     整批调整系统RECORD LIKE xxxx_t.* 星号写法
#161128-00047#1   2017/01/17 By 02295  修改储位后没有触发on row change
#160604-00034#13  2017/01/20 By 08993  若aoos020"進銷存過帳日期控管方式"參數設定為"不可修改"時，則將過帳日期關閉
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"
IMPORT FGL sub_s_lot #151009
#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_sfda_m        RECORD
       sfdadocno LIKE sfda_t.sfdadocno, 
   oobxl003 LIKE type_t.chr80, 
   sfdasite LIKE sfda_t.sfdasite, 
   sfdadocdt LIKE sfda_t.sfdadocdt, 
   sfda001 LIKE sfda_t.sfda001, 
   sfda004 LIKE sfda_t.sfda004, 
   sfda004_desc LIKE type_t.chr80, 
   sfda003 LIKE sfda_t.sfda003, 
   sfda003_desc LIKE type_t.chr80, 
   sfdastus LIKE sfda_t.sfdastus, 
   sfda002 LIKE sfda_t.sfda002, 
   sfda009 LIKE sfda_t.sfda009, 
   sfda009_desc LIKE type_t.chr80, 
   sfda006 LIKE sfda_t.sfda006, 
   sfda006_desc LIKE type_t.chr500, 
   sfda006_desc1 LIKE type_t.chr500, 
   sfda007 LIKE sfda_t.sfda007, 
   sfda008 LIKE sfda_t.sfda008, 
   sfda010 LIKE sfda_t.sfda010, 
   sfda010_desc LIKE type_t.chr80, 
   sfda011 LIKE sfda_t.sfda011, 
   sfda012 LIKE sfda_t.sfda012, 
   sfda012_desc LIKE type_t.chr80, 
   sfda013 LIKE sfda_t.sfda013, 
   sfdacrtid LIKE sfda_t.sfdacrtid, 
   sfdacrtid_desc LIKE type_t.chr80, 
   sfdacrtdp LIKE sfda_t.sfdacrtdp, 
   sfdacrtdp_desc LIKE type_t.chr80, 
   sfdacrtdt LIKE sfda_t.sfdacrtdt, 
   sfdaownid LIKE sfda_t.sfdaownid, 
   sfdaownid_desc LIKE type_t.chr80, 
   sfdaowndp LIKE sfda_t.sfdaowndp, 
   sfdaowndp_desc LIKE type_t.chr80, 
   sfdamodid LIKE sfda_t.sfdamodid, 
   sfdamodid_desc LIKE type_t.chr80, 
   sfdamoddt LIKE sfda_t.sfdamoddt, 
   sfdacnfid LIKE sfda_t.sfdacnfid, 
   sfdacnfid_desc LIKE type_t.chr80, 
   sfdacnfdt LIKE sfda_t.sfdacnfdt, 
   sfdapstid LIKE sfda_t.sfdapstid, 
   sfdapstid_desc LIKE type_t.chr80, 
   sfdapstdt LIKE sfda_t.sfdapstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sfdc_d        RECORD
       sfdcsite LIKE sfdc_t.sfdcsite, 
   sfdcseq LIKE sfdc_t.sfdcseq, 
   sfdc004 LIKE sfdc_t.sfdc004, 
   sfdc004_desc LIKE type_t.chr500, 
   sfdc004_desc1 LIKE type_t.chr500, 
   sfdc005 LIKE sfdc_t.sfdc005, 
   sfdc005_desc LIKE type_t.chr500, 
   imaf034 LIKE type_t.chr1, 
   imae092 LIKE type_t.chr1, 
   sfdc006 LIKE sfdc_t.sfdc006, 
   sfdc007 LIKE sfdc_t.sfdc007, 
   sfdc008 LIKE sfdc_t.sfdc008, 
   sfdc008_desc LIKE type_t.chr500, 
   sfdc009 LIKE sfdc_t.sfdc009, 
   sfdc010 LIKE sfdc_t.sfdc010, 
   sfdc011 LIKE sfdc_t.sfdc011, 
   sfdc011_desc LIKE type_t.chr500, 
   sfdc012 LIKE sfdc_t.sfdc012, 
   sfdc012_desc LIKE type_t.chr500, 
   sfdc013 LIKE sfdc_t.sfdc013, 
   sfdc013_desc LIKE type_t.chr500, 
   sfdc014 LIKE sfdc_t.sfdc014, 
   sfdc016 LIKE sfdc_t.sfdc016, 
   sfdc015 LIKE sfdc_t.sfdc015, 
   sfdc015_desc LIKE type_t.chr500
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sfdadocno LIKE sfda_t.sfdadocno,
      b_sfdadocdt LIKE sfda_t.sfdadocdt,
      b_sfda001 LIKE sfda_t.sfda001,
      b_sfda002 LIKE sfda_t.sfda002,
      b_sfda004 LIKE sfda_t.sfda004,
   b_sfda004_desc LIKE type_t.chr80,
      b_sfda003 LIKE sfda_t.sfda003,
   b_sfda003_desc LIKE type_t.chr80,
      b_sfda006 LIKE sfda_t.sfda006,
   b_sfda006_desc LIKE type_t.chr80,
   b_sfda006_desc1 LIKE type_t.chr80,
      b_sfda007 LIKE sfda_t.sfda007,
      b_sfda008 LIKE sfda_t.sfda008,
      b_sfda009 LIKE sfda_t.sfda009,
      b_sfda010 LIKE sfda_t.sfda010,
   b_sfda010_desc LIKE type_t.chr80,
      b_sfda011 LIKE sfda_t.sfda011,
      b_sfda012 LIKE sfda_t.sfda012,
   b_sfda012_desc LIKE type_t.chr80,
      b_sfda013 LIKE sfda_t.sfda013
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE type_g_sfdc_d2        RECORD
        sfdcseq_2       LIKE sfdc_t.sfdcseq, 
        sfdc004_2       LIKE sfdc_t.sfdc004, 
        sfdc004_2_desc  LIKE type_t.chr80, 
        sfdc004_2_desc1 LIKE type_t.chr80, 
        sfdc005_2       LIKE sfdc_t.sfdc005, 
        imaf034_2       LIKE type_t.chr1, 
        imae092_2       LIKE type_t.chr1, 
        sfdc006_2       LIKE sfdc_t.sfdc006, 
        sfdc007_2       LIKE sfdc_t.sfdc007, 
        sfdc008_2       LIKE sfdc_t.sfdc008, 
        sfdc008_2_desc  LIKE type_t.chr80, 
        sfdc009_2       LIKE sfdc_t.sfdc009, 
        sfdc010_2       LIKE sfdc_t.sfdc010, 
        sfdc011_2       LIKE sfdc_t.sfdc011, 
        sfdc011_2_desc  LIKE type_t.chr80, 
        sfdc012_2       LIKE sfdc_t.sfdc012, 
        sfdc012_2_desc  LIKE type_t.chr80, 
        sfdc013_2       LIKE sfdc_t.sfdc013, 
        sfdc013_2_desc  LIKE type_t.chr80, 
        sfdc014_2       LIKE sfdc_t.sfdc014, 
        sfdc016_2       LIKE sfdc_t.sfdc016, 
        sfdc015_2       LIKE sfdc_t.sfdc015, 
        sfdc015_2_desc  LIKE type_t.chr80
        END RECORD
 TYPE type_g_sfdc_d3        RECORD
        sfddseq1       LIKE sfdd_t.sfddseq1, 
        sfdd001        LIKE sfdd_t.sfdd001, 
        sfdd001_desc   LIKE type_t.chr80, 
        sfdd001_desc1  LIKE type_t.chr80, 
        sfdd013        LIKE sfdd_t.sfdd013,
        sfdd002        LIKE sfdd_t.sfdd002, 
        sfdd003        LIKE sfdd_t.sfdd003,
        sfdd003_desc   LIKE type_t.chr80,  
        sfdd004        LIKE sfdd_t.sfdd004, 
        sfdd004_desc   LIKE type_t.chr80, 
        sfdd005        LIKE sfdd_t.sfdd005,
        sfdd010        LIKE sfdd_t.sfdd010,
        sfdd006        LIKE sfdd_t.sfdd006,
        sfdd007        LIKE sfdd_t.sfdd007,
        sfdd008        LIKE sfdd_t.sfdd008,
        sfdd009        LIKE sfdd_t.sfdd009, 
        sfdd011        LIKE sfdd_t.sfdd011
        END RECORD        
 TYPE type_g_sfdc_d4        RECORD
        inaoseq        LIKE inao_t.inaoseq,
        inaoseq1       LIKE inao_t.inaoseq1,
        inaoseq2       LIKE inao_t.inaoseq2,
        inao001        LIKE inao_t.inao001,
        inao001_desc   LIKE type_t.chr80,
        inao001_desc2  LIKE type_t.chr80,
        inao008        LIKE inao_t.inao008,
        inao009        LIKE inao_t.inao009,
        inao010        LIKE inao_t.inao010,
        inao012        LIKE inao_t.inao012
        END RECORD        
DEFINE g_sfdc_d2             DYNAMIC ARRAY OF type_g_sfdc_d2
DEFINE g_sfdc_d2_t           type_g_sfdc_d2
DEFINE g_sfdc_d3             DYNAMIC ARRAY OF type_g_sfdc_d3
DEFINE g_sfdc_d3_t           type_g_sfdc_d3
DEFINE g_sfdc_d3_o           type_g_sfdc_d3      #151009
DEFINE g_sfdc_d4             DYNAMIC ARRAY OF type_g_sfdc_d4
DEFINE g_sfdc_d4_t           type_g_sfdc_d4
DEFINE l_arg1                LIKE ooef_t.ooef004
DEFINE l_success             LIKE type_t.num5
DEFINE l_year                LIKE type_t.num5
DEFINE l_month               LIKE type_t.num5
DEFINE l_sys                 LIKE type_t.chr80
DEFINE g_docdt               LIKE type_t.dat
DEFINE g_acc                 LIKE gzcb_t.gzcb007 

DEFINE l_ac1                 LIKE type_t.num5
DEFINE g_rec_b1              LIKE type_t.num5
DEFINE l_ac2                 LIKE type_t.num5
DEFINE g_rec_b2              LIKE type_t.num5
DEFINE g_wc3                 STRING
DEFINE g_wc3_table1          STRING
DEFINE g_flag                LIKE type_t.num5
DEFINE g_mdemand             LIKE type_t.chr1
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sfda_m          type_g_sfda_m
DEFINE g_sfda_m_t        type_g_sfda_m
DEFINE g_sfda_m_o        type_g_sfda_m
DEFINE g_sfda_m_mask_o   type_g_sfda_m #轉換遮罩前資料
DEFINE g_sfda_m_mask_n   type_g_sfda_m #轉換遮罩後資料
 
   DEFINE g_sfdadocno_t LIKE sfda_t.sfdadocno
 
 
DEFINE g_sfdc_d          DYNAMIC ARRAY OF type_g_sfdc_d
DEFINE g_sfdc_d_t        type_g_sfdc_d
DEFINE g_sfdc_d_o        type_g_sfdc_d
DEFINE g_sfdc_d_mask_o   DYNAMIC ARRAY OF type_g_sfdc_d #轉換遮罩前資料
DEFINE g_sfdc_d_mask_n   DYNAMIC ARRAY OF type_g_sfdc_d #轉換遮罩後資料
 
 
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
 
{<section id="asrt310.main" >}
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
      CALL cl_get_para(g_enterprise,g_site,'S-MFG-0031') RETURNING l_sys
   LET g_docdt = l_sys
   LET g_acc = ''
   #抓取[T:系統分類值檔].[C:系統分類碼]=24且[T:系統分類值檔].[C:系統分類碼]=g_prog 的[T:系統分類值檔].[C:參考欄位二]的欄位值
   #SELECT gzcb004 INTO g_acc FROM gzcb_t WHERE gzcb001 = '24' AND gzcb002 = g_prog  #160816-00001#10 mark
   LET g_acc = s_fin_get_scc_value('24',g_prog,'2')  #160816-00001#10  Add
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT sfdadocno,'',sfdasite,sfdadocdt,sfda001,sfda004,'',sfda003,'',sfdastus, 
       sfda002,sfda009,'',sfda006,'','',sfda007,sfda008,sfda010,'',sfda011,sfda012,'',sfda013,sfdacrtid, 
       '',sfdacrtdp,'',sfdacrtdt,sfdaownid,'',sfdaowndp,'',sfdamodid,'',sfdamoddt,sfdacnfid,'',sfdacnfdt, 
       sfdapstid,'',sfdapstdt", 
                      " FROM sfda_t",
                      " WHERE sfdaent= ? AND sfdadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt310_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sfdadocno,t0.sfdasite,t0.sfdadocdt,t0.sfda001,t0.sfda004,t0.sfda003, 
       t0.sfdastus,t0.sfda002,t0.sfda009,t0.sfda006,t0.sfda007,t0.sfda008,t0.sfda010,t0.sfda011,t0.sfda012, 
       t0.sfda013,t0.sfdacrtid,t0.sfdacrtdp,t0.sfdacrtdt,t0.sfdaownid,t0.sfdaowndp,t0.sfdamodid,t0.sfdamoddt, 
       t0.sfdacnfid,t0.sfdacnfdt,t0.sfdapstid,t0.sfdapstdt,t1.ooag011 ,t2.ooefl003 ,t3.srza002 ,t4.oocql004 , 
       t5.inaa002 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 ,t10.ooag011 ,t11.ooag011 ,t12.ooag011", 
 
               " FROM sfda_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfda004  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfda003 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN srza_t t3 ON t3.srzaent="||g_enterprise||" AND t3.srzasite=t0.sfdasite AND t3.srza001=t0.sfda009  ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='221' AND t4.oocql002=t0.sfda010 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN inaa_t t5 ON t5.inaaent="||g_enterprise||" AND t5.inaasite=t0.sfdasite AND t5.inaa001=t0.sfda012  ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.sfdacrtid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.sfdacrtdp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.sfdaownid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.sfdaowndp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.sfdamodid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.sfdacnfid  ",
               " LEFT JOIN ooag_t t12 ON t12.ooagent="||g_enterprise||" AND t12.ooag001=t0.sfdapstid  ",
 
               " WHERE t0.sfdaent = " ||g_enterprise|| " AND t0.sfdadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE asrt310_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrt310 WITH FORM cl_ap_formpath("asr",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asrt310_init()   
 
      #進入選單 Menu (="N")
      CALL asrt310_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asrt310
      
   END IF 
   
   CLOSE asrt310_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_lot_sel_drop_tmp()   #151009
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asrt310.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asrt310_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_sys      LIKE type_t.chr80
   DEFINE l_msg      STRING
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
      CALL cl_set_combo_scc_part('sfdastus','13','D,N,W,Y,A,R,S,X,Z')
 
      CALL cl_set_combo_scc('sfda002','4013') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   LET g_mdemand = 'N'
   CALL cl_set_combo_scc('b_sfda002','4013')    
   #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      CALL cl_set_combo_scc_part('sfda002','4013','16')
   END IF
   #IF g_prog = 'asrt320' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt320' THEN   #160705-00042#10 160713 by sakura add
      CALL cl_set_combo_scc_part('sfda002','4013','26')
   END IF
   CALL cl_get_para(g_enterprise,g_site,'S-BAS-0028') RETURNING l_sys
   IF l_sys = 'N' THEN
      CALL cl_set_comp_visible("sfdc009,sfdc010,sfdc011,sfdc011_desc",FALSE)
      CALL cl_set_comp_visible("sfdc009_2,sfdc010_2,sfdc011_2,sfdc011_2_desc",FALSE)
      CALL cl_set_comp_visible("sfdd008,sfdd009",FALSE)
   ELSE
      CALL cl_set_comp_visible("sfdc009,sfdc010,sfdc011,sfdc011_desc",TRUE)
      CALL cl_set_comp_visible("sfdc009_2,sfdc010_2,sfdc011_2,sfdc011_2_desc",TRUE)
      CALL cl_set_comp_visible("sfdd008,sfdd009",TRUE)
   END IF
   #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      CALL cl_getmsg('asr-00029',g_lang) RETURNING l_msg
   ELSE
      CALL cl_getmsg('asr-00030',g_lang) RETURNING l_msg
   END IF
   CALL cl_set_comp_att_text("lbl_sfdadocno",l_msg)
   CALL cl_set_comp_att_text("b_sfdadocno",l_msg)
   #151009
   CALL cl_set_toolbaritem_visible("s_lot_sel,s_lot_sel1",TRUE) #制造批序号维护、申请制造批序号维护
   CALL cl_ui_replace_sub_window(cl_ap_formpath("sub", "s_lot_s01"), "grid_s_lot", "Table", "s_detail1_s_lot_s01")

   CALL s_lot_sel_create_tmp()   
   #end add-point
   
   #初始化搜尋條件
   CALL asrt310_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asrt310.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asrt310_ui_dialog()
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
   #add 151009 --begin
   DEFINE l_inao013        LIKE inao_t.inao013  #出入库码
   DEFINE l_cnt            LIKE type_t.num5 #151009-xianghui
   #add 151009 --en
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
            CALL asrt310_insert()
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
         INITIALIZE g_sfda_m.* TO NULL
         CALL g_sfdc_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asrt310_init()
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
               
               CALL asrt310_fetch('') # reload data
               LET l_ac = 1
               CALL asrt310_ui_detailshow() #Setting the current row 
         
               CALL asrt310_idx_chk()
               #NEXT FIELD sfdcseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sfdc_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt310_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
#               CALL asrt310_b_fill_1()
#               DISPLAY ARRAY g_sfdc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b1)   
#    
#                  BEFORE DISPLAY
#                    EXIT DISPLAY
#               END DISPLAY
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
               CALL asrt310_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_sfdc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               CALL asrt310_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               CALL asrt310_b_fill_2()
             
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               CALL asrt310_idx_chk()
               LET g_current_page = 2
               CALL asrt310_b_fill_1()

            #151009    
            ON ACTION s_lot_sel1
               LET g_action_choice="s_lot_sel1"
               IF cl_auth_chk_act("s_lot_sel1") THEN
                  #150826-00008#3
                  LET l_ac = DIALOG.getCurrentRow("s_detail2")
                  LET g_detail_idx = l_ac
                  #150826-00008#3                  
                  IF cl_null(g_detail_idx) OR g_detail_idx = 0 THEN
                     #单身缺少资料，不可维护！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'abm-00073'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CONTINUE DIALOG
                  END IF
                  
                  IF g_sfda_m.sfdastus <> 'N' THEN
                     #此笔单据状态不是未审核,不可修改！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'apm-00035'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CONTINUE DIALOG
                  END IF
                                   
                  IF cl_null(g_sfdc_d[g_detail_idx].sfdc012) THEN
                     #请先指定库位信息以便挑选批序号资料
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00691'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CONTINUE DIALOG
                  END IF
                  
                  IF NOT cl_null(g_sfda_m.sfdadocno) AND
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdcseq) AND
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc004) AND #料件
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc006) AND #单位
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc007) AND #数量
                     NOT cl_null(g_sfda_m.sfda004) AND               #申请人
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc012) THEN  
                     LET l_success = TRUE
                     CALL s_transaction_begin()
                     
                     #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                        CALL s_lot_sel('1','1',g_site,
                                       g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq,'1', #目的单号，项次，项序
                                       g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005,
                                       g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014,
                                       g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,'-1',g_prog,'',
                                       '','','','0' #来源单号，项次，项序,启用
                                       )
                             RETURNING l_success
                     ELSE #退料
                        #从当前单据中已产生的inao中选取退料资料
                        #              inao中抓 申请的资料 据点
                        CALL s_lot_sel('2','1',g_site,
                        #              目的单号            项次                           项序
                                       g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq,'1',
                        #              料件编号                        产品特征                        库存管理特征仓储批
                                       g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005,g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014,
                        #              退料单位                        数量
                                       g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,
                        #              出入库码 作业编号 据点
                                       '1',g_prog,'',
                        #              来源单号            项次                           项序 启用来源单s据
                                       '','','','1'
                                       )
                             RETURNING l_success                           
                     END IF
                     IF l_success THEN    #150826-00008#3
                        IF asrt310_ins_inao_2() THEN 
                        END IF
                     END IF               #150826-00008#3
                     CALL asrt310_show()                    
                     IF l_success THEN
                        CALL s_transaction_end('Y','0')
                     ELSE
                        CALL s_transaction_end('N','0')
                     END IF
                     CALL asrt310_show()
                  END IF
               END IF
            #add 151009 

         END DISPLAY
         
         DISPLAY ARRAY g_sfdc_d3 TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b1) #page1  
    
            BEFORE ROW
               CALL asrt310_idx_chk()
               LET l_ac1 = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac1
               CALL asrt310_set_act_visible_b()
               CALL asrt310_set_act_no_visible_b()

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac1 = DIALOG.getCurrentRow("s_detail3")
               CALL asrt310_idx_chk()
               LET g_current_page = 3
               
            #151009
            ON ACTION s_lot_sel
               LET g_action_choice="s_lot_sel"
               IF cl_auth_chk_act("s_lot_sel") THEN                 
                  #150826-00008#3
                  LET l_ac1 = DIALOG.getCurrentRow("s_detail3")
                  LET g_detail_idx = l_ac1
                  #150826-00008#3                   
                  IF cl_null(l_ac1) OR l_ac1 = 0 OR cl_null(l_ac) OR l_ac = 0 THEN
                     #未選擇資料,不可執行此操作;请选择一笔明细资料再执行此操作！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00390'  #'abm-00073'单身缺少资料，不可维护！
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     EXIT DIALOG
                  END IF
                  LET l_success = TRUE
                  CALL s_transaction_begin()
                  IF NOT cl_null(g_sfdc_d3[l_ac1].sfddseq1) THEN
                     #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                        CALL s_lot_sel('1','2',#營運據點 目的單據編號
                                       g_site,g_sfda_m.sfdadocno,
                                       #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                       g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                       #料件編號                        產品特徵
                                       g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                       #庫存管理特徵                    庫位
                                       g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                       #儲位                           批號
                                       g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                       #交易單位                       交易數量
                                       g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
                                       '-1',g_prog,'',
                                       '','','','0' #来源单号，项次，项序,启用
                                       )
                             RETURNING l_success
                     ELSE #退料
                        #从当前单据中已产生的inao中选取退料资料
                        #              inao中抓 申请的资料 据点
                        CALL s_lot_sel('2','2',
                                       #營運據點 目的單據編號
                                       g_site,g_sfda_m.sfdadocno,
                                       #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                       g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                       #料件編號                        產品特徵
                                       g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                       #庫存管理特徵                    庫位
                                       g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                       #儲位                           批號
                                       g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                       #交易單位                       交易數量
                                       g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
                                       #出入库码 作业编号 据点
                                       '1',g_prog,'',
                                       #来源单号            项次                           项序 启用来源单据
                                       '','','','1'
                                       )
                             RETURNING l_success 
                        CALL s_asrt310_update_inao('2','1',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1) RETURNING l_success 
                     END IF
                      
                     IF l_success THEN
                        CALL s_transaction_end('Y','0')
                     ELSE
                        CALL s_transaction_end('N','0')
                     END IF
                     CALL asrt310_b_fill_3()                     
                  END IF
               END IF
               EXIT DIALOG               
               #151009

         END DISPLAY
         DISPLAY ARRAY g_sfdc_d4 TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b2) #page1  
    
            BEFORE ROW
               CALL asrt310_idx_chk()
               LET l_ac2 = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac2

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac2 = DIALOG.getCurrentRow("s_detail4")
               CALL asrt310_idx_chk()
               LET g_current_page = 4

         END DISPLAY
         SUBDIALOG sub_s_lot.s_lot_display  
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asrt310_browser_fill("")
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
               CALL asrt310_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asrt310_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asrt310_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL asrt310_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL asrt310_set_act_visible()   
            CALL asrt310_set_act_no_visible()
            IF NOT (g_sfda_m.sfdadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sfdaent = " ||g_enterprise|| " AND",
                                  " sfdadocno = '", g_sfda_m.sfdadocno, "' "
 
               #填到對應位置
               CALL asrt310_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "sfda_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfdc_t" 
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
               CALL asrt310_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "sfda_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfdc_t" 
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
                  CALL asrt310_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asrt310_fetch("F")
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
               CALL asrt310_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asrt310_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt310_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asrt310_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt310_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asrt310_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt310_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asrt310_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt310_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asrt310_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt310_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_sfdc_d)
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
               NEXT FIELD sfdcseq
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
               CALL asrt310_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL asrt310_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               EXIT DIALOG
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL asrt310_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asrt310_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/asr/asrt310_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/asr/asrt310_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asrt310_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION mdemand
            LET g_action_choice="mdemand"
            IF cl_auth_chk_act("mdemand") THEN
               
               #add-point:ON ACTION mdemand name="menu.mdemand"
               LET g_mdemand = 'Y'
               CALL asrt310_input('u')
               LET g_mdemand = 'N'
               EXIT DIALOG
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asrt310_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asrt310_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asrt310_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_sfda_m.sfdadocdt)
 
 
 
         
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
 
{<section id="asrt310.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asrt310_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
      DEFINE l_wc3             STRING
   DEFINE l_ooag002       LIKE ooag_t.ooag002
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
   CALL g_sfdc_d2.clear()
   CALL g_sfdc_d3.clear()
   LET l_wc3 = g_wc3.trim()
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sfdadocno ",
                      " FROM sfda_t ",
                      " ",
                      " LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ", "  ",
                      #add-point:browser_fill段sql(sfdc_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE sfdaent = " ||g_enterprise|| " AND sfdcent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sfda_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sfdadocno ",
                      " FROM sfda_t ", 
                      "  ",
                      "  ",
                      " WHERE sfdaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("sfda_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
      #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
      IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      IF g_wc3 <> " 1=1" THEN
         #联动的单身有輸入搜尋條件                      
         LET l_sub_sql = "SELECT UNIQUE sfdadocno ",
                         "  FROM sfda_t ",
                         "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ",
                         "  LEFT JOIN sfdd_t ON sfddent = sfdaent AND sfdadocno = sfdddocno ",
                         " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 = '16' AND sfdcent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2, " AND ", l_wc3
      ELSE
         IF g_wc2 <> " 1=1" THEN
            #單身有輸入搜尋條件
            LET l_sub_sql = "SELECT UNIQUE sfdadocno ",
                            "  FROM sfda_t ",
                            "  LEFT JOIN sfdc_t ON sfdcent = sfdaent  AND sfdadocno = sfdcdocno ",
                            " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 = '16' AND sfdcent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2
         ELSE
            LET l_sub_sql = "SELECT UNIQUE sfdadocno ",
                            "  FROM sfda_t ",
                            " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 = '16' AND ",l_wc CLIPPED
         END IF
      END IF
   ELSE
      IF g_wc3 <> " 1=1" THEN
         #联动的单身有輸入搜尋條件                      
         LET l_sub_sql = "SELECT UNIQUE sfdadocno ",
                         "  FROM sfda_t ",
                         "  LEFT JOIN sfdc_t ON sfdcent = sfdaent  AND sfdadocno = sfdcdocno ",
                         "  LEFT JOIN sfdd_t ON sfddent = sfdaent  AND sfdadocno = sfdddocno ",
                         " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND  AND sfda002 = '26' sfdcent = '" ||g_enterprise|| "'  AND ",l_wc, " AND ", l_wc2, " AND ", l_wc3
      ELSE
         IF g_wc2 <> " 1=1" THEN
            #單身有輸入搜尋條件
            LET l_sub_sql = "SELECT UNIQUE sfdadocno ",
                            "  FROM sfda_t ",
                            "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ",
                            " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 = '26' AND sfdcent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2
         ELSE
            LET l_sub_sql = "SELECT UNIQUE sfdadocno ",
                            "  FROM sfda_t ",
                            " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 = '26' AND ",l_wc CLIPPED
         END IF
      END IF
   END IF
   LET g_sql = " SELECT COUNT(*) FROM (",l_sub_sql,")"  
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
      INITIALIZE g_sfda_m.* TO NULL
      CALL g_sfdc_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sfdadocno,t0.sfdadocdt,t0.sfda001,t0.sfda002,t0.sfda004,t0.sfda003,t0.sfda006,t0.sfda007,t0.sfda008,t0.sfda009,t0.sfda010,t0.sfda011,t0.sfda012,t0.sfda013 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfdastus,t0.sfdadocno,t0.sfdadocdt,t0.sfda001,t0.sfda002,t0.sfda004, 
          t0.sfda003,t0.sfda006,t0.sfda007,t0.sfda008,t0.sfda009,t0.sfda010,t0.sfda011,t0.sfda012,t0.sfda013, 
          t1.ooag011 ,t2.ooefl003 ,t3.imaal003 ,t4.oocql004 ",
                  " FROM sfda_t t0",
                  "  ",
                  "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ", "  ", 
                  #add-point:browser_fill段sql(sfdc_t1) name="browser_fill.join.sfdc_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfda004  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfda003 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=t0.sfda006 AND t3.imaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='221' AND t4.oocql002=t0.sfda010 AND t4.oocql003='"||g_dlang||"' ",
 
                  " WHERE t0.sfdaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sfda_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfdastus,t0.sfdadocno,t0.sfdadocdt,t0.sfda001,t0.sfda002,t0.sfda004, 
          t0.sfda003,t0.sfda006,t0.sfda007,t0.sfda008,t0.sfda009,t0.sfda010,t0.sfda011,t0.sfda012,t0.sfda013, 
          t1.ooag011 ,t2.ooefl003 ,t3.imaal003 ,t4.oocql004 ",
                  " FROM sfda_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfda004  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfda003 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=t0.sfda006 AND t3.imaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='221' AND t4.oocql002=t0.sfda010 AND t4.oocql003='"||g_dlang||"' ",
 
                  " WHERE t0.sfdaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("sfda_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY sfdadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      IF g_wc3 <> " 1=1" THEN
         #联动的单身有輸入搜尋條件                      
         #依照sfdadocno,sfdadocdt,sfda001,sfda002,sfda004,sfda003,sfda006,sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013 Browser欄位定義(取代原本bs_sql功能)
         LET l_sql_rank = "SELECT DISTINCT sfdastus,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda002,sfda004,'',sfda003,'',sfda006,'','',sfda007,sfda008,sfda009,sfda010,'',sfda011,sfda012,sfda013,DENSE_RANK() OVER(ORDER BY sfdadocno ",g_order,") AS RANK ",
                          "  FROM sfda_t ",
                          "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ",
                          "  LEFT JOIN sfdd_t ON sfddent = sfdaent AND sfdadocno = sfdddocno ",
                          " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 ='16' AND ",l_wc," AND ",l_wc2," AND ",l_wc3
      ELSE
         IF g_wc2 <> " 1=1" THEN
            #單身有輸入搜尋條件
            LET l_sql_rank = "SELECT DISTINCT sfdastus,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda002,sfda004,'',sfda003,''sfda006,'','',sfda007,sfda008,sfda009,sfda010,'',sfda011,sfda012,sfda013,DENSE_RANK() OVER(ORDER BY sfdadocno ",g_order,") AS RANK ",
                             "  FROM sfda_t ",
                             "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ",
                             " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 ='16' AND ",l_wc," AND ",l_wc2
         ELSE
            LET l_sql_rank = "SELECT DISTINCT sfdastus,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda002,sfda004,'',sfda003,'',sfda006,'','',sfda007,sfda008,sfda009,sfda010,'',sfda011,sfda012,sfda013,DENSE_RANK() OVER(ORDER BY sfdadocno ",g_order,") AS RANK ",
                             "  FROM sfda_t ",
                             " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 ='16' AND ", l_wc
         END IF
      END IF
   ELSE
      IF g_wc3 <> " 1=1" THEN
         #联动的单身有輸入搜尋條件                      
         #依照sfdadocno,sfdadocdt,sfda001,sfda002,sfda004,sfda003,sfda006,sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013 Browser欄位定義(取代原本bs_sql功能)
         LET l_sql_rank = "SELECT DISTINCT sfdastus,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda002,sfda004,'',sfda003,'',sfda006,'','',sfda007,sfda008,sfda009,sfda010,'',sfda011,sfda012,sfda013,DENSE_RANK() OVER(ORDER BY sfdadocno ",g_order,") AS RANK ",
                          "  FROM sfda_t ",
                          "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ",
                          "  LEFT JOIN sfdd_t ON sfddent = sfdaent AND sfdadocno = sfdddocno ",
                          " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 ='26' AND ",l_wc," AND ",l_wc2," AND ",l_wc3
      ELSE
         IF g_wc2 <> " 1=1" THEN
            #單身有輸入搜尋條件
            LET l_sql_rank = "SELECT DISTINCT sfdastus,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda002,sfda004,'',sfda003,''sfda006,'','',sfda007,sfda008,sfda009,sfda010,'',sfda011,sfda012,sfda013,DENSE_RANK() OVER(ORDER BY sfdadocno ",g_order,") AS RANK ",
                             "  FROM sfda_t ",
                             "  LEFT JOIN sfdc_t ON sfdcent = sfdaent AND sfdadocno = sfdcdocno ",
                             " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 ='26' AND ",l_wc," AND ",l_wc2
         ELSE
            LET l_sql_rank = "SELECT DISTINCT sfdastus,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda002,sfda004,'',sfda003,'',sfda006,'','',sfda007,sfda008,sfda009,sfda010,'',sfda011,sfda012,sfda013,DENSE_RANK() OVER(ORDER BY sfdadocno ",g_order,") AS RANK ",
                             "  FROM sfda_t ",
                             " WHERE sfdaent = '" ||g_enterprise|| "' AND sfdasite='",g_site,"' AND sfda002 ='26' AND ", l_wc
         END IF
      END IF
   END IF   
   #定義翻頁CURSOR
   LET g_sql= "SELECT sfdastus,sfdadocno,sfdadocdt,sfda001,sfda002,sfda004,sfda003,sfda006,sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013,'','','','' FROM (",l_sql_rank,") WHERE ",
              " RANK >= ",1," AND RANK<",1+g_max_browse,
              " ORDER BY sfdadocno ",g_order 
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sfda_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
   
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sfdadocno,g_browser[g_cnt].b_sfdadocdt, 
          g_browser[g_cnt].b_sfda001,g_browser[g_cnt].b_sfda002,g_browser[g_cnt].b_sfda004,g_browser[g_cnt].b_sfda003, 
          g_browser[g_cnt].b_sfda006,g_browser[g_cnt].b_sfda007,g_browser[g_cnt].b_sfda008,g_browser[g_cnt].b_sfda009, 
          g_browser[g_cnt].b_sfda010,g_browser[g_cnt].b_sfda011,g_browser[g_cnt].b_sfda012,g_browser[g_cnt].b_sfda013, 
          g_browser[g_cnt].b_sfda004_desc,g_browser[g_cnt].b_sfda003_desc,g_browser[g_cnt].b_sfda006_desc, 
          g_browser[g_cnt].b_sfda010_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
            INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_browser[g_cnt].b_sfda006
      CALL ap_ref_array2(g_ref_fields,"SELECT imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_lang||"'","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_sfda006_desc1 = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_browser[g_cnt].b_sfda006_desc1
      
      SELECT ooag002 INTO l_ooag002
        FROM ooag_t
       WHERE ooagent = g_enterprise
         AND ooag001 = g_browser[g_cnt].b_sfda004
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = l_ooag002
      CALL ap_ref_array2(g_ref_fields,"SELECT oofa011 FROM oofa_t WHERE oofaent='"||g_enterprise||"' AND oofa002='2' AND oofa001=? ","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_sfda004_desc =  g_rtn_fields[1]
      DISPLAY BY NAME g_browser[g_cnt].b_sfda004_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_browser[g_cnt].b_sfda010
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_lang||"'","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_sfda010_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_browser[g_cnt].b_sfda010_desc
      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_browser[g_cnt].b_sfda012
      CALL ap_ref_array2(g_ref_fields,"SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite = '"||g_site||"' AND inaa001=? ","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_sfda012_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_browser[g_cnt].b_sfda012_desc
         #end add-point
      
         #遮罩相關處理
         CALL asrt310_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_sfdadocno) THEN
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
   CALL asrt310_show()
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asrt310_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sfda_m.sfdadocno = g_browser[g_current_idx].b_sfdadocno   
 
   EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
       g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
       g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
       g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt, 
       g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc,g_sfda_m.sfda009_desc, 
       g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc 
 
   
   CALL asrt310_sfda_t_mask()
   CALL asrt310_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asrt310.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asrt310_ui_detailshow()
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
 
{<section id="asrt310.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asrt310_ui_browser_refresh()
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
      IF g_browser[l_i].b_sfdadocno = g_sfda_m.sfdadocno 
 
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
 
{<section id="asrt310.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt310_construct()
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
   INITIALIZE g_sfda_m.* TO NULL
   CALL g_sfdc_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON sfdadocno,oobxl003,sfdasite,sfdadocdt,sfda001,sfda004,sfda003,sfdastus, 
          sfda002,sfda009,sfda006,sfda007,sfda008,sfda010,sfda011,sfda012,sfda013,sfdacrtid,sfdacrtdp, 
          sfdacrtdt,sfdaownid,sfdaowndp,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sfdacrtdt>>----
         AFTER FIELD sfdacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sfdamoddt>>----
         AFTER FIELD sfdamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfdacnfdt>>----
         AFTER FIELD sfdacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfdapstdt>>----
         AFTER FIELD sfdapstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sfdadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdadocno
            #add-point:ON ACTION controlp INFIELD sfdadocno name="construct.c.sfdadocno"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			#IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark   
			IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
			   LET g_qryparam.where = " sfda002 = '16'"
			END IF
			#IF g_prog = 'asrt320' THEN        #160705-00042#10 160713 by sakura mark
			IF g_prog MATCHES 'asrt320' THEN   #160705-00042#10 160713 by sakura add
			   LET g_qryparam.where = " sfda002 = '26'"
			END IF
            CALL q_sfdadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdadocno  #顯示到畫面上
            LET g_qryparam.where =""
            NEXT FIELD sfdadocno                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdadocno
            #add-point:BEFORE FIELD sfdadocno name="construct.b.sfdadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdadocno
            
            #add-point:AFTER FIELD sfdadocno name="construct.a.sfdadocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD oobxl003
            #add-point:BEFORE FIELD oobxl003 name="construct.b.oobxl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD oobxl003
            
            #add-point:AFTER FIELD oobxl003 name="construct.a.oobxl003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.oobxl003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD oobxl003
            #add-point:ON ACTION controlp INFIELD oobxl003 name="construct.c.oobxl003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdasite
            #add-point:BEFORE FIELD sfdasite name="construct.b.sfdasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdasite
            
            #add-point:AFTER FIELD sfdasite name="construct.a.sfdasite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfdasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdasite
            #add-point:ON ACTION controlp INFIELD sfdasite name="construct.c.sfdasite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdadocdt
            #add-point:BEFORE FIELD sfdadocdt name="construct.b.sfdadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdadocdt
            
            #add-point:AFTER FIELD sfdadocdt name="construct.a.sfdadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfdadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdadocdt
            #add-point:ON ACTION controlp INFIELD sfdadocdt name="construct.c.sfdadocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda001
            #add-point:BEFORE FIELD sfda001 name="construct.b.sfda001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda001
            
            #add-point:AFTER FIELD sfda001 name="construct.a.sfda001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda001
            #add-point:ON ACTION controlp INFIELD sfda001 name="construct.c.sfda001"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfda004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda004
            #add-point:ON ACTION controlp INFIELD sfda004 name="construct.c.sfda004"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda004  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO oofa011 #全名 

            NEXT FIELD sfda004                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda004
            #add-point:BEFORE FIELD sfda004 name="construct.b.sfda004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda004
            
            #add-point:AFTER FIELD sfda004 name="construct.a.sfda004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda003
            #add-point:ON ACTION controlp INFIELD sfda003 name="construct.c.sfda003"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = g_sfda_m.sfdadocdt
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda003  #顯示到畫面上

            NEXT FIELD sfda003                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda003
            #add-point:BEFORE FIELD sfda003 name="construct.b.sfda003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda003
            
            #add-point:AFTER FIELD sfda003 name="construct.a.sfda003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdastus
            #add-point:BEFORE FIELD sfdastus name="construct.b.sfdastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdastus
            
            #add-point:AFTER FIELD sfdastus name="construct.a.sfdastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfdastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdastus
            #add-point:ON ACTION controlp INFIELD sfdastus name="construct.c.sfdastus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda002
            #add-point:BEFORE FIELD sfda002 name="construct.b.sfda002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda002
            
            #add-point:AFTER FIELD sfda002 name="construct.a.sfda002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda002
            #add-point:ON ACTION controlp INFIELD sfda002 name="construct.c.sfda002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfda009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda009
            #add-point:ON ACTION controlp INFIELD sfda009 name="construct.c.sfda009"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_sraa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda009  #顯示到畫面上

            NEXT FIELD sfda009                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda009
            #add-point:BEFORE FIELD sfda009 name="construct.b.sfda009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda009
            
            #add-point:AFTER FIELD sfda009 name="construct.a.sfda009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda006
            #add-point:ON ACTION controlp INFIELD sfda006 name="construct.c.sfda006"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_srab004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda006  #顯示到畫面上

            NEXT FIELD sfda006                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda006
            #add-point:BEFORE FIELD sfda006 name="construct.b.sfda006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda006
            
            #add-point:AFTER FIELD sfda006 name="construct.a.sfda006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda007
            #add-point:ON ACTION controlp INFIELD sfda007 name="construct.c.sfda007"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_srab004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda007  #顯示到畫面上

            NEXT FIELD sfda007                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda007
            #add-point:BEFORE FIELD sfda007 name="construct.b.sfda007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda007
            
            #add-point:AFTER FIELD sfda007 name="construct.a.sfda007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda008
            #add-point:ON ACTION controlp INFIELD sfda008 name="construct.c.sfda008"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_srab004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda008  #顯示到畫面上

            NEXT FIELD sfda008                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda008
            #add-point:BEFORE FIELD sfda008 name="construct.b.sfda008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda008
            
            #add-point:AFTER FIELD sfda008 name="construct.a.sfda008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda010
            #add-point:ON ACTION controlp INFIELD sfda010 name="construct.c.sfda010"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_bmba007()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda010  #顯示到畫面上

            NEXT FIELD sfda010                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda010
            #add-point:BEFORE FIELD sfda010 name="construct.b.sfda010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda010
            
            #add-point:AFTER FIELD sfda010 name="construct.a.sfda010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda011
            #add-point:ON ACTION controlp INFIELD sfda011 name="construct.c.sfda011"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_bmba008()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda011  #顯示到畫面上

            NEXT FIELD sfda011                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda011
            #add-point:BEFORE FIELD sfda011 name="construct.b.sfda011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda011
            
            #add-point:AFTER FIELD sfda011 name="construct.a.sfda011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda012
            #add-point:ON ACTION controlp INFIELD sfda012 name="construct.c.sfda012"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfda012  #顯示到畫面上

            NEXT FIELD sfda012                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda012
            #add-point:BEFORE FIELD sfda012 name="construct.b.sfda012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda012
            
            #add-point:AFTER FIELD sfda012 name="construct.a.sfda012"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda013
            #add-point:BEFORE FIELD sfda013 name="construct.b.sfda013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda013
            
            #add-point:AFTER FIELD sfda013 name="construct.a.sfda013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfda013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda013
            #add-point:ON ACTION controlp INFIELD sfda013 name="construct.c.sfda013"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfdacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdacrtid
            #add-point:ON ACTION controlp INFIELD sfdacrtid name="construct.c.sfdacrtid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdacrtid  #顯示到畫面上

            NEXT FIELD sfdacrtid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdacrtid
            #add-point:BEFORE FIELD sfdacrtid name="construct.b.sfdacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdacrtid
            
            #add-point:AFTER FIELD sfdacrtid name="construct.a.sfdacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfdacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdacrtdp
            #add-point:ON ACTION controlp INFIELD sfdacrtdp name="construct.c.sfdacrtdp"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdacrtdp  #顯示到畫面上

            NEXT FIELD sfdacrtdp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdacrtdp
            #add-point:BEFORE FIELD sfdacrtdp name="construct.b.sfdacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdacrtdp
            
            #add-point:AFTER FIELD sfdacrtdp name="construct.a.sfdacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdacrtdt
            #add-point:BEFORE FIELD sfdacrtdt name="construct.b.sfdacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfdaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdaownid
            #add-point:ON ACTION controlp INFIELD sfdaownid name="construct.c.sfdaownid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdaownid  #顯示到畫面上

            NEXT FIELD sfdaownid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdaownid
            #add-point:BEFORE FIELD sfdaownid name="construct.b.sfdaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdaownid
            
            #add-point:AFTER FIELD sfdaownid name="construct.a.sfdaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfdaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdaowndp
            #add-point:ON ACTION controlp INFIELD sfdaowndp name="construct.c.sfdaowndp"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdaowndp  #顯示到畫面上

            NEXT FIELD sfdaowndp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdaowndp
            #add-point:BEFORE FIELD sfdaowndp name="construct.b.sfdaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdaowndp
            
            #add-point:AFTER FIELD sfdaowndp name="construct.a.sfdaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfdamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdamodid
            #add-point:ON ACTION controlp INFIELD sfdamodid name="construct.c.sfdamodid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdamodid  #顯示到畫面上

            NEXT FIELD sfdamodid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdamodid
            #add-point:BEFORE FIELD sfdamodid name="construct.b.sfdamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdamodid
            
            #add-point:AFTER FIELD sfdamodid name="construct.a.sfdamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdamoddt
            #add-point:BEFORE FIELD sfdamoddt name="construct.b.sfdamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfdacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdacnfid
            #add-point:ON ACTION controlp INFIELD sfdacnfid name="construct.c.sfdacnfid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdacnfid  #顯示到畫面上

            NEXT FIELD sfdacnfid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdacnfid
            #add-point:BEFORE FIELD sfdacnfid name="construct.b.sfdacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdacnfid
            
            #add-point:AFTER FIELD sfdacnfid name="construct.a.sfdacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdacnfdt
            #add-point:BEFORE FIELD sfdacnfdt name="construct.b.sfdacnfdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfdapstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdapstid
            #add-point:ON ACTION controlp INFIELD sfdapstid name="construct.c.sfdapstid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdapstid  #顯示到畫面上

            NEXT FIELD sfdapstid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdapstid
            #add-point:BEFORE FIELD sfdapstid name="construct.b.sfdapstid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdapstid
            
            #add-point:AFTER FIELD sfdapstid name="construct.a.sfdapstid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdapstdt
            #add-point:BEFORE FIELD sfdapstdt name="construct.b.sfdapstdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sfdcseq,sfdc004,sfdc005,sfdc005_desc,imaf034,imae092,sfdc006,sfdc007, 
          sfdc008,sfdc008_desc,sfdc009,sfdc010,sfdc011,sfdc011_desc,sfdc012,sfdc013,sfdc014,sfdc016, 
          sfdc015
           FROM s_detail1[1].sfdcseq,s_detail1[1].sfdc004,s_detail1[1].sfdc005,s_detail1[1].sfdc005_desc, 
               s_detail1[1].imaf034,s_detail1[1].imae092,s_detail1[1].sfdc006,s_detail1[1].sfdc007,s_detail1[1].sfdc008, 
               s_detail1[1].sfdc008_desc,s_detail1[1].sfdc009,s_detail1[1].sfdc010,s_detail1[1].sfdc011, 
               s_detail1[1].sfdc011_desc,s_detail1[1].sfdc012,s_detail1[1].sfdc013,s_detail1[1].sfdc014, 
               s_detail1[1].sfdc016,s_detail1[1].sfdc015
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdcseq
            #add-point:BEFORE FIELD sfdcseq name="construct.b.page1.sfdcseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdcseq
            
            #add-point:AFTER FIELD sfdcseq name="construct.a.page1.sfdcseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdcseq
            #add-point:ON ACTION controlp INFIELD sfdcseq name="construct.c.page1.sfdcseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfdc004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc004
            #add-point:ON ACTION controlp INFIELD sfdc004 name="construct.c.page1.sfdc004"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_imaf001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc004  #顯示到畫面上

            NEXT FIELD sfdc004                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc004
            #add-point:BEFORE FIELD sfdc004 name="construct.b.page1.sfdc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc004
            
            #add-point:AFTER FIELD sfdc004 name="construct.a.page1.sfdc004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc005
            #add-point:BEFORE FIELD sfdc005 name="construct.b.page1.sfdc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc005
            
            #add-point:AFTER FIELD sfdc005 name="construct.a.page1.sfdc005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc005
            #add-point:ON ACTION controlp INFIELD sfdc005 name="construct.c.page1.sfdc005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc005_desc
            #add-point:BEFORE FIELD sfdc005_desc name="construct.b.page1.sfdc005_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc005_desc
            
            #add-point:AFTER FIELD sfdc005_desc name="construct.a.page1.sfdc005_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc005_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc005_desc
            #add-point:ON ACTION controlp INFIELD sfdc005_desc name="construct.c.page1.sfdc005_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaf034
            #add-point:BEFORE FIELD imaf034 name="construct.b.page1.imaf034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imaf034
            
            #add-point:AFTER FIELD imaf034 name="construct.a.page1.imaf034"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.imaf034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaf034
            #add-point:ON ACTION controlp INFIELD imaf034 name="construct.c.page1.imaf034"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imae092
            #add-point:BEFORE FIELD imae092 name="construct.b.page1.imae092"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imae092
            
            #add-point:AFTER FIELD imae092 name="construct.a.page1.imae092"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.imae092
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imae092
            #add-point:ON ACTION controlp INFIELD imae092 name="construct.c.page1.imae092"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfdc006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc006
            #add-point:ON ACTION controlp INFIELD sfdc006 name="construct.c.page1.sfdc006"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc006  #顯示到畫面上

            NEXT FIELD sfdc006                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc006
            #add-point:BEFORE FIELD sfdc006 name="construct.b.page1.sfdc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc006
            
            #add-point:AFTER FIELD sfdc006 name="construct.a.page1.sfdc006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc007
            #add-point:BEFORE FIELD sfdc007 name="construct.b.page1.sfdc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc007
            
            #add-point:AFTER FIELD sfdc007 name="construct.a.page1.sfdc007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc007
            #add-point:ON ACTION controlp INFIELD sfdc007 name="construct.c.page1.sfdc007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc008
            #add-point:BEFORE FIELD sfdc008 name="construct.b.page1.sfdc008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc008
            
            #add-point:AFTER FIELD sfdc008 name="construct.a.page1.sfdc008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc008
            #add-point:ON ACTION controlp INFIELD sfdc008 name="construct.c.page1.sfdc008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc008_desc
            #add-point:BEFORE FIELD sfdc008_desc name="construct.b.page1.sfdc008_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc008_desc
            
            #add-point:AFTER FIELD sfdc008_desc name="construct.a.page1.sfdc008_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc008_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc008_desc
            #add-point:ON ACTION controlp INFIELD sfdc008_desc name="construct.c.page1.sfdc008_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfdc009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc009
            #add-point:ON ACTION controlp INFIELD sfdc009 name="construct.c.page1.sfdc009"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc009  #顯示到畫面上
         
            NEXT FIELD sfdc009                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc009
            #add-point:BEFORE FIELD sfdc009 name="construct.b.page1.sfdc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc009
            
            #add-point:AFTER FIELD sfdc009 name="construct.a.page1.sfdc009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc010
            #add-point:BEFORE FIELD sfdc010 name="construct.b.page1.sfdc010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc010
            
            #add-point:AFTER FIELD sfdc010 name="construct.a.page1.sfdc010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc010
            #add-point:ON ACTION controlp INFIELD sfdc010 name="construct.c.page1.sfdc010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc011
            #add-point:BEFORE FIELD sfdc011 name="construct.b.page1.sfdc011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc011
            
            #add-point:AFTER FIELD sfdc011 name="construct.a.page1.sfdc011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc011
            #add-point:ON ACTION controlp INFIELD sfdc011 name="construct.c.page1.sfdc011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc011_desc
            #add-point:BEFORE FIELD sfdc011_desc name="construct.b.page1.sfdc011_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc011_desc
            
            #add-point:AFTER FIELD sfdc011_desc name="construct.a.page1.sfdc011_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc011_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc011_desc
            #add-point:ON ACTION controlp INFIELD sfdc011_desc name="construct.c.page1.sfdc011_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfdc012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc012
            #add-point:ON ACTION controlp INFIELD sfdc012 name="construct.c.page1.sfdc012"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc012  #顯示到畫面上

            NEXT FIELD sfdc012                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc012
            #add-point:BEFORE FIELD sfdc012 name="construct.b.page1.sfdc012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc012
            
            #add-point:AFTER FIELD sfdc012 name="construct.a.page1.sfdc012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc013
            #add-point:ON ACTION controlp INFIELD sfdc013 name="construct.c.page1.sfdc013"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inab002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc013  #顯示到畫面上

            NEXT FIELD sfdc013                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc013
            #add-point:BEFORE FIELD sfdc013 name="construct.b.page1.sfdc013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc013
            
            #add-point:AFTER FIELD sfdc013 name="construct.a.page1.sfdc013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc014
            #add-point:ON ACTION controlp INFIELD sfdc014 name="construct.c.page1.sfdc014"
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_sfdc014_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc014  #顯示到畫面上

            NEXT FIELD sfdc014                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc014
            #add-point:BEFORE FIELD sfdc014 name="construct.b.page1.sfdc014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc014
            
            #add-point:AFTER FIELD sfdc014 name="construct.a.page1.sfdc014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc016
            #add-point:ON ACTION controlp INFIELD sfdc016 name="construct.c.page1.sfdc016"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_sfdc016_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc016  #顯示到畫面上

            NEXT FIELD sfdc016                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc016
            #add-point:BEFORE FIELD sfdc016 name="construct.b.page1.sfdc016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc016
            
            #add-point:AFTER FIELD sfdc016 name="construct.a.page1.sfdc016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfdc015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc015
            #add-point:ON ACTION controlp INFIELD sfdc015 name="construct.c.page1.sfdc015"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = g_acc
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdc015  #顯示到畫面上

            NEXT FIELD sfdc015                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc015
            #add-point:BEFORE FIELD sfdc015 name="construct.b.page1.sfdc015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc015
            
            #add-point:AFTER FIELD sfdc015 name="construct.a.page1.sfdc015"
            
            #END add-point
            
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
            #單身根據table分拆construct
      CONSTRUCT g_wc3_table1 ON sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005,sfdd010,sfdd006,sfdd007,sfdd008,sfdd009,sfdd011
           FROM s_detail1[1].sfddseq1,s_detail1[1].sfdd001,s_detail1[1].sfdd002,s_detail1[1].sfdd003,s_detail1[1].sfdd004,s_detail1[1].sfdd005,s_detail1[1].sfdd010,s_detail1[1].sfdd006,s_detail1[1].sfdd007,s_detail1[1].sfdd008,s_detail1[1].sfdd009,s_detail1[1].sfdd011
           
         BEFORE CONSTRUCT
            #CALL cl_qbe_display_condition(lc_qbe_sn)
            

         BEFORE FIELD sfddseq1
         
         AFTER FIELD sfddseq1
 
         ON ACTION controlp INFIELD sfdd001
            #開窗c段
		    INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		   	LET g_qryparam.reqry = FALSE
            CALL q_bmea008_3()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd001  #顯示到畫面上
            NEXT FIELD sfdd001                     #返回原欄位

         BEFORE FIELD sfdd001

         AFTER FIELD sfdd001
         
         BEFORE FIELD sfdd002

         AFTER FIELD sfdd002

         BEFORE FIELD sfdd003

         AFTER FIELD sfdd003
         
         ON ACTION controlp INFIELD sfdd003
            #開窗c段
		  	INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		    LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd003  #顯示到畫面上
            NEXT FIELD sfdd003                     #返回原欄位
         
         BEFORE FIELD sfdd004

         AFTER FIELD sfdd004
         
         ON ACTION controlp INFIELD sfdd004
            #開窗c段
		    INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		  	LET g_qryparam.reqry = FALSE
            CALL q_inab002_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd003  #顯示到畫面上
            NEXT FIELD sfdd004                     #返回原欄位
         
         BEFORE FIELD sfdd005
         
         AFTER FIELD sfdd005
            
         ON ACTION controlp INFIELD sfdd005
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_sfdd005()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd005  #顯示到畫面上
            NEXT FIELD sfdc005                     #返回原欄位
            
         ON ACTION controlp INFIELD sfdd006
            #開窗c段
			      INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			      LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd006  #顯示到畫面上
           
            NEXT FIELD sfdd006                     #返回原欄位

         BEFORE FIELD sfdd006
         
         AFTER FIELD sfdd006
            
         BEFORE FIELD sfdd007
           
         AFTER FIELD sfdd007
        
         BEFORE FIELD sfdd008
        
         AFTER FIELD sfdd008
            
          
         ON ACTION controlp INFIELD sfdd008
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
	         LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd008  #顯示到畫面上
            NEXT FIELD sfdd008                     #返回原欄位

     
         BEFORE FIELD sfdd009
           
         AFTER FIELD sfdd009
            
         
         BEFORE FIELD sfdd010
          
         AFTER FIELD sfdd010
           
         ON ACTION controlp INFIELD sfdd010
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_sfdd010()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfdd010  #顯示到畫面上
            NEXT FIELD sfdc010                     #返回原欄位
            
         BEFORE FIELD sfdd011
           
         AFTER FIELD sfdd011
            
       
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
                  WHEN la_wc[li_idx].tableid = "sfda_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfdc_t" 
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
      LET g_wc3 = g_wc3_table1
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION asrt310_filter()
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
      CONSTRUCT g_wc_filter ON sfdadocno,sfdadocdt,sfda001,sfda002,sfda004,sfda003,sfda006,sfda007,sfda008, 
          sfda009,sfda010,sfda011,sfda012,sfda013
                          FROM s_browse[1].b_sfdadocno,s_browse[1].b_sfdadocdt,s_browse[1].b_sfda001, 
                              s_browse[1].b_sfda002,s_browse[1].b_sfda004,s_browse[1].b_sfda003,s_browse[1].b_sfda006, 
                              s_browse[1].b_sfda007,s_browse[1].b_sfda008,s_browse[1].b_sfda009,s_browse[1].b_sfda010, 
                              s_browse[1].b_sfda011,s_browse[1].b_sfda012,s_browse[1].b_sfda013
 
         BEFORE CONSTRUCT
               DISPLAY asrt310_filter_parser('sfdadocno') TO s_browse[1].b_sfdadocno
            DISPLAY asrt310_filter_parser('sfdadocdt') TO s_browse[1].b_sfdadocdt
            DISPLAY asrt310_filter_parser('sfda001') TO s_browse[1].b_sfda001
            DISPLAY asrt310_filter_parser('sfda002') TO s_browse[1].b_sfda002
            DISPLAY asrt310_filter_parser('sfda004') TO s_browse[1].b_sfda004
            DISPLAY asrt310_filter_parser('sfda003') TO s_browse[1].b_sfda003
            DISPLAY asrt310_filter_parser('sfda006') TO s_browse[1].b_sfda006
            DISPLAY asrt310_filter_parser('sfda007') TO s_browse[1].b_sfda007
            DISPLAY asrt310_filter_parser('sfda008') TO s_browse[1].b_sfda008
            DISPLAY asrt310_filter_parser('sfda009') TO s_browse[1].b_sfda009
            DISPLAY asrt310_filter_parser('sfda010') TO s_browse[1].b_sfda010
            DISPLAY asrt310_filter_parser('sfda011') TO s_browse[1].b_sfda011
            DISPLAY asrt310_filter_parser('sfda012') TO s_browse[1].b_sfda012
            DISPLAY asrt310_filter_parser('sfda013') TO s_browse[1].b_sfda013
      
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
 
      CALL asrt310_filter_show('sfdadocno')
   CALL asrt310_filter_show('sfdadocdt')
   CALL asrt310_filter_show('sfda001')
   CALL asrt310_filter_show('sfda002')
   CALL asrt310_filter_show('sfda004')
   CALL asrt310_filter_show('sfda003')
   CALL asrt310_filter_show('sfda006')
   CALL asrt310_filter_show('sfda007')
   CALL asrt310_filter_show('sfda008')
   CALL asrt310_filter_show('sfda009')
   CALL asrt310_filter_show('sfda010')
   CALL asrt310_filter_show('sfda011')
   CALL asrt310_filter_show('sfda012')
   CALL asrt310_filter_show('sfda013')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION asrt310_filter_parser(ps_field)
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
 
{<section id="asrt310.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION asrt310_filter_show(ps_field)
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
   LET ls_condition = asrt310_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asrt310_query()
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
   CALL g_sfdc_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asrt310_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asrt310_browser_fill("")
      CALL asrt310_fetch("")
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
      CALL asrt310_filter_show('sfdadocno')
   CALL asrt310_filter_show('sfdadocdt')
   CALL asrt310_filter_show('sfda001')
   CALL asrt310_filter_show('sfda002')
   CALL asrt310_filter_show('sfda004')
   CALL asrt310_filter_show('sfda003')
   CALL asrt310_filter_show('sfda006')
   CALL asrt310_filter_show('sfda007')
   CALL asrt310_filter_show('sfda008')
   CALL asrt310_filter_show('sfda009')
   CALL asrt310_filter_show('sfda010')
   CALL asrt310_filter_show('sfda011')
   CALL asrt310_filter_show('sfda012')
   CALL asrt310_filter_show('sfda013')
   CALL asrt310_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asrt310_fetch("F") 
      #顯示單身筆數
      CALL asrt310_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asrt310_fetch(p_flag)
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
   
   LET g_sfda_m.sfdadocno = g_browser[g_current_idx].b_sfdadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
       g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
       g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
       g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt, 
       g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc,g_sfda_m.sfda009_desc, 
       g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc 
 
   
   #遮罩相關處理
   LET g_sfda_m_mask_o.* =  g_sfda_m.*
   CALL asrt310_sfda_t_mask()
   LET g_sfda_m_mask_n.* =  g_sfda_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt310_set_act_visible()   
   CALL asrt310_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
 
   #end add-point
   
   #保存單頭舊值
   LET g_sfda_m_t.* = g_sfda_m.*
   LET g_sfda_m_o.* = g_sfda_m.*
   
   LET g_data_owner = g_sfda_m.sfdaownid      
   LET g_data_dept  = g_sfda_m.sfdaowndp
   
   #重新顯示   
   CALL asrt310_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.insert" >}
#+ 資料新增
PRIVATE FUNCTION asrt310_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sfdc_d.clear()   
 
 
   INITIALIZE g_sfda_m.* TO NULL             #DEFAULT 設定
   
   LET g_sfdadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfda_m.sfdaownid = g_user
      LET g_sfda_m.sfdaowndp = g_dept
      LET g_sfda_m.sfdacrtid = g_user
      LET g_sfda_m.sfdacrtdp = g_dept 
      LET g_sfda_m.sfdacrtdt = cl_get_current()
      LET g_sfda_m.sfdamodid = g_user
      LET g_sfda_m.sfdamoddt = cl_get_current()
      LET g_sfda_m.sfdastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_sfda_m.sfdastus = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
            CALL g_sfdc_d2.clear()
      CALL g_sfdc_d3.clear()       
      LET g_sfda_m.sfdadocdt = g_today
      LET g_sfda_m.sfdasite = g_site
      
      
      CALL asrt310_def_sfda009()
      CALL asrt310_def_srab()
      LET g_sfda_m.sfda001 = g_today
      LET g_sfda_m.sfda003 = g_dept
      LET g_sfda_m.sfda004 = g_user
      #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
      IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
         LET g_sfda_m.sfda002 = '16'
         CALL asrt310_def_sfda013()   
      ELSE
         LET g_sfda_m.sfda002 = '26'
         LET g_sfda_m.sfda013 = 0
      END IF
      CALL asrt310_desc()
      INITIALIZE g_sfda_m_t.* TO NULL
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sfda_m_t.* = g_sfda_m.*
      LET g_sfda_m_o.* = g_sfda_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfda_m.sfdastus 
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
 
 
 
    
      CALL asrt310_input("a")
      
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
         INITIALIZE g_sfda_m.* TO NULL
         INITIALIZE g_sfdc_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asrt310_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sfdc_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt310_set_act_visible()   
   CALL asrt310_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfdaent = " ||g_enterprise|| " AND",
                      " sfdadocno = '", g_sfda_m.sfdadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   CALL asrt310_show()
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt310_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asrt310_cl
   
   CALL asrt310_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
       g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
       g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
       g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt, 
       g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc,g_sfda_m.sfda009_desc, 
       g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc 
 
   
   
   #遮罩相關處理
   LET g_sfda_m_mask_o.* =  g_sfda_m.*
   CALL asrt310_sfda_t_mask()
   LET g_sfda_m_mask_n.* =  g_sfda_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfda_m.sfdadocno,g_sfda_m.oobxl003,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001, 
       g_sfda_m.sfda004,g_sfda_m.sfda004_desc,g_sfda_m.sfda003,g_sfda_m.sfda003_desc,g_sfda_m.sfdastus, 
       g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda009_desc,g_sfda_m.sfda006,g_sfda_m.sfda006_desc, 
       g_sfda_m.sfda006_desc1,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda010_desc, 
       g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda012_desc,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtid_desc, 
       g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdamoddt, 
       g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid,g_sfda_m.sfdapstid_desc, 
       g_sfda_m.sfdapstdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_sfda_m.sfdaownid      
   LET g_data_dept  = g_sfda_m.sfdaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt310_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.modify" >}
#+ 資料修改
PRIVATE FUNCTION asrt310_modify()
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
   LET g_sfda_m_t.* = g_sfda_m.*
   LET g_sfda_m_o.* = g_sfda_m.*
   
   IF g_sfda_m.sfdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
   CALL s_transaction_begin()
   
   OPEN asrt310_cl USING g_enterprise,g_sfda_m.sfdadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt310_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt310_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
       g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
       g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
       g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt, 
       g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc,g_sfda_m.sfda009_desc, 
       g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc 
 
   
   #檢查是否允許此動作
   IF NOT asrt310_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfda_m_mask_o.* =  g_sfda_m.*
   CALL asrt310_sfda_t_mask()
   LET g_sfda_m_mask_n.* =  g_sfda_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL asrt310_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sfda_m.sfdamodid = g_user 
LET g_sfda_m.sfdamoddt = cl_get_current()
LET g_sfda_m.sfdamodid_desc = cl_get_username(g_sfda_m.sfdamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asrt310_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sfda_t SET (sfdamodid,sfdamoddt) = (g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt)
          WHERE sfdaent = g_enterprise AND sfdadocno = g_sfdadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sfda_m.* = g_sfda_m_t.*
            CALL asrt310_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sfda_m.sfdadocno != g_sfda_m_t.sfdadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE sfdc_t SET sfdcdocno = g_sfda_m.sfdadocno
 
          WHERE sfdcent = g_enterprise AND sfdcdocno = g_sfda_m_t.sfdadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
                  UPDATE sfdd_t 
            SET sfdddocno = g_sfda_m.sfdadocno
          WHERE sfddent = g_enterprise
            AND sfdddocno = g_sfdadocno_t
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfdc_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfdc_t:",SQLERRMESSAGE 
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
   CALL asrt310_set_act_visible()   
   CALL asrt310_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sfdaent = " ||g_enterprise|| " AND",
                      " sfdadocno = '", g_sfda_m.sfdadocno, "' "
 
   #填到對應位置
   CALL asrt310_browser_fill("")
 
   CLOSE asrt310_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt310_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asrt310.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt310_input(p_cmd)
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
      DEFINE l_sfdd012        LIKE sfdd_t.sfdd012
   DEFINE l_ac1_t          LIKE type_t.num5
   DEFINE l_n1             LIKE type_t.num5
   DEFINE l_num            LIKE type_t.num5
   DEFINE l_sys            LIKE type_t.chr80   
   DEFINE l_imaa006        LIKE imaa_t.imaa006
   DEFINE l_rate           LIKE type_t.num26_10 
   DEFINE l_sfdd007        LIKE sfdd_t.sfdd007
   DEFINE l_sfdd009        LIKE sfdd_t.sfdd009
   DEFINE l_ooef004        LIKE ooef_t.ooef004
   DEFINE l_time           DATETIME YEAR TO SECOND 
   DEFINE l_srza007        LIKE srza_t.srza007
   #add 151009 --begin
   DEFINE l_imaf071        LIKE imaf_t.imaf071
   DEFINE l_imaf081        LIKE imaf_t.imaf081
   DEFINE l_amount         LIKE sfdc_t.sfdc007
   DEFINE l_amountr        LIKE sfdc_t.sfdc010
   DEFINE l_inao013        LIKE inao_t.inao013  #出入库码
   DEFINE l_prog           LIKE gzzz_t.gzzz001   #作业编号（可当单据类型用）
   #add 151009 --end   
   DEFINE l_flag            LIKE type_t.num5     #161006-00018#13 add
   DEFINE l_ooac002         LIKE ooac_t.ooac002  #161006-00018#13 add
   DEFINE l_ooac004         LIKE ooac_t.ooac004  #161006-00018#13 add
   
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
   DISPLAY BY NAME g_sfda_m.sfdadocno,g_sfda_m.oobxl003,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001, 
       g_sfda_m.sfda004,g_sfda_m.sfda004_desc,g_sfda_m.sfda003,g_sfda_m.sfda003_desc,g_sfda_m.sfdastus, 
       g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda009_desc,g_sfda_m.sfda006,g_sfda_m.sfda006_desc, 
       g_sfda_m.sfda006_desc1,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda010_desc, 
       g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda012_desc,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtid_desc, 
       g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdamoddt, 
       g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid,g_sfda_m.sfdapstid_desc, 
       g_sfda_m.sfdapstdt
   
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
   LET g_forupd_sql = "SELECT sfdcsite,sfdcseq,sfdc004,sfdc005,sfdc006,sfdc007,sfdc008,sfdc009,sfdc010, 
       sfdc011,sfdc012,sfdc013,sfdc014,sfdc016,sfdc015 FROM sfdc_t WHERE sfdcent=? AND sfdcdocno=? AND  
       sfdcseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt310_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt310_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
      LET g_errshow = 1 
   #end add-point
   CALL asrt310_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sfda_m.sfdadocno,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004, 
       g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007, 
       g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda013
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   #LET g_forupd_sql = "SELECT sfddseq1,sfdd001,'','',sfdd002,sfdd003,'',sfdd004,'',sfdd005,sfdd010,sfdd006,sfdd007,sfdd008,sfdd009,sfdd011 FROM sfdd_t WHERE sfddent=? AND sfddsite=? AND sfdddocno=? AND sfddseq=? AND sfddseq1 = ?  FOR UPDATE"   #161006-00018#13 mark
   LET g_forupd_sql = "SELECT sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005,sfdd010,sfdd006,sfdd007,sfdd008,sfdd009,sfdd011 FROM sfdd_t WHERE sfddent=? AND sfddsite=? AND sfdddocno=? AND sfddseq=? AND sfddseq1 = ?  FOR UPDATE"   #161006-00018#13 add
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE asrt310_bcl2 CURSOR FROM g_forupd_sql
   LET g_flag = FALSE
   CALL asrt310_set_entry(p_cmd)
   CALL asrt310_set_no_entry(p_cmd)
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asrt310.input.head" >}
      #單頭段
      INPUT BY NAME g_sfda_m.sfdadocno,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004, 
          g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007, 
          g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda013 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN asrt310_cl USING g_enterprise,g_sfda_m.sfdadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt310_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt310_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asrt310_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            IF g_mdemand = 'Y' THEN
               NEXT FIELD sfddseq1
            END IF
            #end add-point
            CALL asrt310_set_no_entry(p_cmd)
    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdadocno
            #add-point:BEFORE FIELD sfdadocno name="input.b.sfdadocno"
            CALL asrt310_sfdadocno_desc('1',g_sfda_m.sfdadocno) RETURNING g_sfda_m.oobxl003
            DISPLAY BY NAME g_sfda_m.oobxl003            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdadocno
            
            #add-point:AFTER FIELD sfdadocno name="input.a.sfdadocno"
            CALL asrt310_sfdadocno_desc('1',g_sfda_m.sfdadocno) RETURNING g_sfda_m.oobxl003
            DISPLAY BY NAME g_sfda_m.oobxl003
#此段落由子樣板a05產生
            IF NOT cl_null(g_sfda_m.sfdadocno) THEN 
#               CALL asrt310_chk_sfdadocno()
#               IF NOT cl_null(g_errno) THEN
#                  CALL cl_err(g_sfda_m.sfdadocno,g_errno,1)
#                  LET g_sfda_m.sfdadocno = g_sfdadocno_t
#                  NEXT FIELD CURRENT
#               END IF
                LET l_ooef004 = ""
                #LET g_sfda_m.oobal004 = ""
                SELECT ooef004 INTO l_ooef004
                  FROM ooef_t
                 WHERE ooef001 = g_site
                   AND ooefent = g_enterprise
               CALL s_aooi200_chk_docno(g_site,g_sfda_m.sfdadocno,g_sfda_m.sfdadocdt,g_prog) RETURNING l_success
               IF NOT l_success THEN
                  LET g_sfda_m.sfdadocno = g_sfdadocno_t
                  NEXT FIELD CURRENT
               END IF
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfda_m.sfdadocno != g_sfdadocno_t )) THEN 
                  IF NOT ap_chk_notDup(g_sfda_m.sfdadocno,"SELECT COUNT(*) FROM sfda_t WHERE "||"sfdaent = '" ||g_enterprise|| "'  AND "||"sfdadocno = '"||g_sfda_m.sfdadocno ||"'",'std-00004',0) THEN 
                     LET g_sfda_m.sfdadocno = g_sfdadocno_t
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #CALL asrt310_get_oobal004()
#               NEXT FIELD sfdadocdt
            ELSE
#                LET g_sfda_m.oobal004 = ''
#                DISPLAY BY NAME g_sfda_m.oobal004
#               NEXT FIELD sfdadocno
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdadocno
            #add-point:ON CHANGE sfdadocno name="input.g.sfdadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdasite
            #add-point:BEFORE FIELD sfdasite name="input.b.sfdasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdasite
            
            #add-point:AFTER FIELD sfdasite name="input.a.sfdasite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdasite
            #add-point:ON CHANGE sfdasite name="input.g.sfdasite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdadocdt
            #add-point:BEFORE FIELD sfdadocdt name="input.b.sfdadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdadocdt
            
            #add-point:AFTER FIELD sfdadocdt name="input.a.sfdadocdt"
            IF NOT cl_null(g_sfda_m.sfdadocdt) THEN
               IF g_sfda_m.sfdadocdt < g_docdt THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asr-00004'
                  LET g_errparam.extend = g_sfda_m.sfdadocdt
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfdadocdt = g_sfda_m_t.sfdadocdt
                  NEXT FIELD sfdadocno
               END IF
               #151120-00003#1 20151120 mark by beckxie---S
               #IF g_sfda_m.sfda001 < g_sfda_m.sfdadocdt THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code = 'apm-00783'
               #   LET g_errparam.extend = g_sfda_m.sfdadocdt
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #
               #   LET g_sfda_m.sfdadocdt = g_sfda_m_t.sfdadocdt
               #   NEXT FIELD sfdadocno               
               #END IF               
               #151120-00003#1 20151120 mark by beckxie---E
#               CALL s_aooi200_gen_docno(g_site,g_sfda_m.sfdadocno,g_sfda_m.sfdadocdt,g_prog) RETURNING l_success,g_sfda_m.sfdadocno
#               IF NOT l_success THEN
#                  CALL cl_err(g_sfda_m.sfdadocdt,'apm-00003',1)
#                  LET g_sfda_m.sfdadocdt = g_sfda_m_t.sfdadocdt
#                  DISPLAY g_sfda_m.sfdadocdt TO sfdadocdt
#                  NEXT FIELD sfdadocno
#               END IF
               IF p_cmd = 'a' THEN
                  CALL asrt310_def_sfda009()
                  CALL asrt310_def_srab()
                  #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
                  IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
                     CALL asrt310_def_sfda013()
                  END IF
               END IF
#            ELSE
#               NEXT FIELD sfdadocdt
            END IF
            LET g_flag = TRUE
#            CALL asrt310_set_entry(p_cmd)
#            CALL asrt310_set_no_entry(p_cmd)
            
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdadocdt
            #add-point:ON CHANGE sfdadocdt name="input.g.sfdadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda001
            #add-point:BEFORE FIELD sfda001 name="input.b.sfda001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda001
            
            #add-point:AFTER FIELD sfda001 name="input.a.sfda001"
            IF NOT cl_null(g_sfda_m.sfda001) THEN
               IF g_sfda_m.sfda001 < g_docdt THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asr-00004'
                  LET g_errparam.extend = g_sfda_m.sfda001
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfda001 = g_sfda_m_t.sfda001
                  NEXT FIELD sfda001
               END IF
               #151120-00003#1 20151120 mark by beckxie---S
               #IF g_sfda_m.sfda001 < g_sfda_m.sfdadocdt THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code = 'apm-00783'
               #   LET g_errparam.extend = g_sfda_m.sfda001
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #
               #   LET g_sfda_m.sfda001 = g_sfda_m_t.sfda001
               #   NEXT FIELD sfda001               
               #END IF
               #151120-00003#1 20151120 mark by beckxie---E
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda001
            #add-point:ON CHANGE sfda001 name="input.g.sfda001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda004
            
            #add-point:AFTER FIELD sfda004 name="input.a.sfda004"
                        CALL asrt310_desc()
            IF NOT cl_null(g_sfda_m.sfda004) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfda_m.sfda004
               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               #160318-00025#22  by 07900 --add-end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ooag001") THEN
                  LET g_sfda_m.sfda004 = g_sfda_m_t.sfda004
                  CALL asrt310_desc()
                  NEXT FIELD sfda004
               END IF
               SELECT ooag003 INTO g_sfda_m.sfda003
                 FROM ooag_t
                WHERE ooagent = g_enterprise
                  AND ooag001 = g_sfda_m.sfda004
               CALL asrt310_desc()
            END IF

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda004
            #add-point:BEFORE FIELD sfda004 name="input.b.sfda004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda004
            #add-point:ON CHANGE sfda004 name="input.g.sfda004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda003
            
            #add-point:AFTER FIELD sfda003 name="input.a.sfda003"
                        CALL asrt310_desc()
            IF NOT cl_null(g_sfda_m.sfda003) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfda_m.sfda003
               LET g_chkparam.arg2 = g_sfda_m.sfdadocdt
               #160318-00025#22  by 07900 --add-str
              LET g_errshow = TRUE #是否開窗                   
              LET g_chkparam.err_str[1] ="aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
              #160318-00025#22  by 07900 --add-end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ooeg001_3") THEN
                  LET g_sfda_m.sfda003 = g_sfda_m_t.sfda003
                  CALL asrt310_desc()
                  NEXT FIELD sfda003
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda003
            #add-point:BEFORE FIELD sfda003 name="input.b.sfda003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda003
            #add-point:ON CHANGE sfda003 name="input.g.sfda003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdastus
            #add-point:BEFORE FIELD sfdastus name="input.b.sfdastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdastus
            
            #add-point:AFTER FIELD sfdastus name="input.a.sfdastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdastus
            #add-point:ON CHANGE sfdastus name="input.g.sfdastus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda002
            #add-point:BEFORE FIELD sfda002 name="input.b.sfda002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda002
            
            #add-point:AFTER FIELD sfda002 name="input.a.sfda002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda002
            #add-point:ON CHANGE sfda002 name="input.g.sfda002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda009
            
            #add-point:AFTER FIELD sfda009 name="input.a.sfda009"
            #            CALL asrt310_chk_srab() 
#            IF NOT cl_null(g_errno) THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_sfda_m.sfda009
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()

#               LET g_sfda_m.sfda009 = g_sfda_m_t.sfda009
#               NEXT FIELD CURRENT
#            END IF
            IF NOT cl_null(g_sfda_m.sfda013) THEN 
               CALL asrt310_chk_sfda013()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfda_m.sfda009
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfda009 = g_sfda_m_t.sfda009
                  NEXT FIELD sfda009
               END IF 
            END IF
            CALL asrt310_desc()
            IF p_cmd = 'a' THEN
               CALL asrt310_def_srab()
               #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
               IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
                  CALL asrt310_def_sfda013()
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda009
            #add-point:BEFORE FIELD sfda009 name="input.b.sfda009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda009
            #add-point:ON CHANGE sfda009 name="input.g.sfda009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda006
            
            #add-point:AFTER FIELD sfda006 name="input.a.sfda006"
            IF NOT cl_null(g_sfda_m.sfda006) AND NOT cl_null(g_sfda_m.sfda013) THEN 
               CALL asrt310_chk_sfda013()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfda_m.sfda006
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfda006 = g_sfda_m_t.sfda006
                  NEXT FIELD sfda006
               END IF 
            END IF            
            CALL asrt310_desc()
            #IF p_cmd = 'a' AND g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
            IF p_cmd = 'a' AND g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
               CALL asrt310_def_sfda013()
            END IF
#            CALL asrt310_chk_srab() 
#            IF NOT cl_null(g_errno) THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_sfda_m.sfda006
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()

#               LET g_sfda_m.sfda006 = g_sfda_m_t.sfda006
#               CALL asrt310_desc() 
#               NEXT FIELD CURRENT
#            END IF
#            CALL asrt310_chk_bmba()
#            IF NOT cl_null(g_errno) THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_sfda_m.sfda006
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()

#               LET g_sfda_m.sfda006 = g_sfda_m_t.sfda006
#               CALL asrt310_desc() 
#               NEXT FIELD CURRENT
#            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda006
            #add-point:BEFORE FIELD sfda006 name="input.b.sfda006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda006
            #add-point:ON CHANGE sfda006 name="input.g.sfda006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda007
            #add-point:BEFORE FIELD sfda007 name="input.b.sfda007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda007
            
            #add-point:AFTER FIELD sfda007 name="input.a.sfda007"
            IF cl_null(g_sfda_m.sfda007) THEN
               LET g_sfda_m.sfda007 = ' '
            END IF
            IF g_sfda_m.sfda007 IS NOT NULL AND NOT cl_null(g_sfda_m.sfda013) THEN 
               CALL asrt310_chk_sfda013()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfda_m.sfda007
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfda007 = g_sfda_m_t.sfda007
                  NEXT FIELD sfda007
               END IF 
            END IF  
            #IF p_cmd = 'a' AND g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
            IF p_cmd = 'a' AND g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
               CALL asrt310_def_sfda013()
            END IF
#            CALL asrt310_chk_srab() 
#            IF NOT cl_null(g_errno) THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_sfda_m.sfda007
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()

#               LET g_sfda_m.sfda007 = g_sfda_m_t.sfda007
#               NEXT FIELD CURRENT
#            END IF
#            CALL asrt310_chk_bmba()
#            IF NOT cl_null(g_errno) THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_sfda_m.sfda007
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()

#               LET g_sfda_m.sfda007 = g_sfda_m_t.sfda007
#               NEXT FIELD CURRENT
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda007
            #add-point:ON CHANGE sfda007 name="input.g.sfda007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda008
            #add-point:BEFORE FIELD sfda008 name="input.b.sfda008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda008
            
            #add-point:AFTER FIELD sfda008 name="input.a.sfda008"
            IF cl_null(g_sfda_m.sfda008) THEN
               LET g_sfda_m.sfda008 = ' '
            END IF
            IF g_sfda_m.sfda008 IS NOT NULL AND NOT cl_null(g_sfda_m.sfda013) THEN 
               CALL asrt310_chk_sfda013()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfda_m.sfda008
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfda008 = g_sfda_m_t.sfda008
                  NEXT FIELD sfda008
               END IF 
            END IF 
            #IF p_cmd = 'a' AND g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
            IF p_cmd = 'a' AND g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
               CALL asrt310_def_sfda013()
            END IF
#            CALL asrt310_chk_srab() 
#            IF NOT cl_null(g_errno) THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_sfda_m.sfda008
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()

#               LET g_sfda_m.sfda008 = g_sfda_m_t.sfda008
#               NEXT FIELD CURRENT
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda008
            #add-point:ON CHANGE sfda008 name="input.g.sfda008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda010
            
            #add-point:AFTER FIELD sfda010 name="input.a.sfda010"
                        CALL asrt310_desc()
#            IF NOT cl_null(g_sfda_m.sfda010) THEN
#               CALL asrt310_chk_bmba007()
#               IF NOT cl_null(g_errno) THEN
#                  CALL cl_err(g_sfda_m.sfda010,g_errno,1)
#                  LET g_sfda_m.sfda010 = g_sfda_m_t.sfda010
#                  CALL asrt310_desc()
#                  NEXT FIELD sfda010
#               END IF
#            END IF

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda010
            #add-point:BEFORE FIELD sfda010 name="input.b.sfda010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda010
            #add-point:ON CHANGE sfda010 name="input.g.sfda010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda011
            #add-point:BEFORE FIELD sfda011 name="input.b.sfda011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda011
            
            #add-point:AFTER FIELD sfda011 name="input.a.sfda011"
            #            IF NOT cl_null(g_sfda_m.sfda011) THEN
#               CALL asrt310_chk_bmba008()
#               IF NOT cl_null(g_errno) THEN
#                  CALL cl_err(g_sfda_m.sfda011,g_errno,1)
#                  LET g_sfda_m.sfda011 = g_sfda_m_t.sfda011
#                  NEXT FIELD sfda011
#               END IF
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda011
            #add-point:ON CHANGE sfda011 name="input.g.sfda011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda012
            
            #add-point:AFTER FIELD sfda012 name="input.a.sfda012"
                        CALL asrt310_desc()
            IF NOT cl_null(g_sfda_m.sfda012) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfda_m.sfda012
               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
              #160318-00025#22  by 07900 --add-end 
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_inaa001_2") THEN
                  LET g_sfda_m.sfda012 = g_sfda_m_t.sfda012
                  CALL asrt310_desc()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda012
            #add-point:BEFORE FIELD sfda012 name="input.b.sfda012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda012
            #add-point:ON CHANGE sfda012 name="input.g.sfda012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfda013
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfda_m.sfda013,"0.000000","1","","","azz-00079",1) THEN
               NEXT FIELD sfda013
            END IF 
 
 
 
            #add-point:AFTER FIELD sfda013 name="input.a.sfda013"
            IF NOT cl_null(g_sfda_m.sfda013) THEN 
               CALL asrt310_chk_sfda013()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfda_m.sfda013
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfda_m.sfda013 = g_sfda_m_t.sfda013
                  NEXT FIELD sfda013
               END IF 
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfda013
            #add-point:BEFORE FIELD sfda013 name="input.b.sfda013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfda013
            #add-point:ON CHANGE sfda013 name="input.g.sfda013"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sfdadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdadocno
            #add-point:ON ACTION controlp INFIELD sfdadocno name="input.c.sfdadocno"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfdadocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_arg1 
              FROM ooef_t 
             WHERE ooef001 = g_site
               AND ooefent  = g_enterprise
            LET g_qryparam.arg1 = l_arg1 #參照表編號
            LET g_qryparam.arg2 = g_prog #作业代号

            CALL q_ooba002_1()                                #呼叫開窗

            LET g_sfda_m.sfdadocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfda_m.sfdadocno TO sfdadocno              #顯示到畫面上

            NEXT FIELD sfdadocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfdasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdasite
            #add-point:ON ACTION controlp INFIELD sfdasite name="input.c.sfdasite"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfdadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdadocdt
            #add-point:ON ACTION controlp INFIELD sfdadocdt name="input.c.sfdadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfda001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda001
            #add-point:ON ACTION controlp INFIELD sfda001 name="input.c.sfda001"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfda004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda004
            #add-point:ON ACTION controlp INFIELD sfda004 name="input.c.sfda004"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda004             #給予default值
            LET g_qryparam.default2 = "" #g_sfda_m.oofa011 #全名

            #給予arg

            CALL q_ooag001_2()                                #呼叫開窗

            LET g_sfda_m.sfda004 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_sfda_m.oofa011 = g_qryparam.return2 #全名

            DISPLAY g_sfda_m.sfda004 TO sfda004              #顯示到畫面上
            #DISPLAY g_sfda_m.oofa011 TO oofa011 #全名
            CALL asrt310_desc()
            NEXT FIELD sfda004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda003
            #add-point:ON ACTION controlp INFIELD sfda003 name="input.c.sfda003"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_sfda_m.sfdadocdt

            CALL q_ooeg001()                                #呼叫開窗

            LET g_sfda_m.sfda003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfda_m.sfda003 TO sfda003              #顯示到畫面上
            CALL asrt310_desc()
            NEXT FIELD sfda003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfdastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdastus
            #add-point:ON ACTION controlp INFIELD sfdastus name="input.c.sfdastus"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfda002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda002
            #add-point:ON ACTION controlp INFIELD sfda002 name="input.c.sfda002"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfda009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda009
            #add-point:ON ACTION controlp INFIELD sfda009 name="input.c.sfda009"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda009             #給予default值

            #給予arg
            IF NOT cl_null(g_sfda_m.sfdadocdt) THEN
               LET l_year = YEAR(g_sfda_m.sfdadocdt)
               LET l_month = MONTH(g_sfda_m.sfdadocdt)
               LET g_qryparam.where = " sraa002 ='",l_year,"' AND sraa003 = '",l_month,"'"
            END IF
            CALL q_sraa001()                                #呼叫開窗

            LET g_sfda_m.sfda009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfda_m.sfda009 TO sfda009              #顯示到畫面上
            CALL asrt310_desc()
            NEXT FIELD sfda009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda006
            #add-point:ON ACTION controlp INFIELD sfda006 name="input.c.sfda006"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda006             #給予default值

            #給予arg
            IF NOT cl_null(g_sfda_m.sfdadocdt) THEN
               LET l_year = YEAR(g_sfda_m.sfdadocdt)
               LET l_month = MONTH(g_sfda_m.sfdadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
            END IF
            IF NOT cl_null(g_sfda_m.sfda009) THEN
               LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"'"
            END IF
            IF NOT cl_null(g_sfda_m.sfdadocdt) AND NOT cl_null(g_sfda_m.sfda009) THEN
               LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
            END IF
            CALL q_srab004()                                #呼叫開窗

            LET g_sfda_m.sfda006 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfda_m.sfda007 = g_qryparam.return2
            LET g_sfda_m.sfda008 = g_qryparam.return3
            DISPLAY g_sfda_m.sfda006 TO sfda006              #顯示到畫面上
            LET g_qryparam.where = ""
            NEXT FIELD sfda006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda007
            #add-point:ON ACTION controlp INFIELD sfda007 name="input.c.sfda007"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda007             #給予default值

            #給予arg
            IF NOT cl_null(g_sfda_m.sfdadocdt) THEN
               LET l_year = YEAR(g_sfda_m.sfdadocdt)
               LET l_month = MONTH(g_sfda_m.sfdadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfda_m.sfda006) THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfda_m.sfda006,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfda_m.sfda009) THEN
               LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"'"
               IF NOT cl_null(g_sfda_m.sfda006) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"'  AND srab004 = '",g_sfda_m.sfda006,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfda_m.sfdadocdt) AND NOT cl_null(g_sfda_m.sfda009) THEN
               LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfda_m.sfda006) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfda_m.sfda006,"'"  
               END IF
            END IF
            CALL q_srab004()                                #呼叫開窗
            IF cl_null(g_sfda_m.sfda006) THEN
               LET g_sfda_m.sfda006 = g_qryparam.return1
            END IF
            LET g_sfda_m.sfda007 = g_qryparam.return2
            LET g_sfda_m.sfda008 = g_qryparam.return3

            DISPLAY g_sfda_m.sfda007 TO sfda007              #顯示到畫面上
            
            LET g_qryparam.where = ""
            NEXT FIELD sfda007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda008
            #add-point:ON ACTION controlp INFIELD sfda008 name="input.c.sfda008"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda008             #給予default值

            #給予arg
            IF NOT cl_null(g_sfda_m.sfdadocdt) THEN
               LET l_year = YEAR(g_sfda_m.sfdadocdt)
               LET l_month = MONTH(g_sfda_m.sfdadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfda_m.sfda006) THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfda_m.sfda006,"'"  
               END IF
               IF g_sfda_m.sfda007 IS NOT NULL THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab005 = '",g_sfda_m.sfda007,"'"  
               END IF
               IF NOT cl_null(g_sfda_m.sfda006) AND g_sfda_m.sfda007 IS NOT NULL THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfda_m.sfda006,"' AND srab005 = '",g_sfda_m.sfda007,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfda_m.sfda009) THEN
               LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"'"
               IF NOT cl_null(g_sfda_m.sfda006) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab004 = '",g_sfda_m.sfda006,"'"  
               END IF
               IF g_sfda_m.sfda007 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab005 = '",g_sfda_m.sfda007,"'"  
               END IF
               IF NOT cl_null(g_sfda_m.sfda006) AND g_sfda_m.sfda007 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab004 = '",g_sfda_m.sfda006,"' AND srab005 = '",g_sfda_m.sfda007,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfda_m.sfdadocdt) AND NOT cl_null(g_sfda_m.sfda009) THEN
               LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfda_m.sfda006) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfda_m.sfda006,"'"  
               END IF
               IF g_sfda_m.sfda007 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab005 = '",g_sfda_m.sfda007,"'"  
               END IF
               IF NOT cl_null(g_sfda_m.sfda006) AND g_sfda_m.sfda007 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfda_m.sfda009,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfda_m.sfda006,"' AND srab005 = '",g_sfda_m.sfda007,"'"  
               END IF
            END IF
            CALL q_srab004()                                #呼叫開窗
            IF cl_null(g_sfda_m.sfda006) THEN
               LET g_sfda_m.sfda006 = g_qryparam.return1
            END IF
            IF cl_null(g_sfda_m.sfda007) THEN
               LET g_sfda_m.sfda007 = g_qryparam.return2
            END IF
            LET g_sfda_m.sfda008 = g_qryparam.return3

            DISPLAY g_sfda_m.sfda008 TO sfda008              #顯示到畫面上
            LET g_qryparam.where = ""
            NEXT FIELD sfda008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda010
            #add-point:ON ACTION controlp INFIELD sfda010 name="input.c.sfda010"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda010             #給予default值

            #給予arg
            IF NOT cl_null(g_sfda_m.sfda011) THEN
               LET g_qryparam.where = " bmba008 = '",g_sfda_m.sfda011,"'"
            END IF
            CALL q_bmba007()                                #呼叫開窗
            
            LET g_sfda_m.sfda010 = g_qryparam.return1              #將開窗取得的值回傳到變數
            IF cl_null(g_sfda_m.sfda011) THEN
               LET g_sfda_m.sfda011 = g_qryparam.return2
            END IF
            DISPLAY g_sfda_m.sfda010 TO sfda010              #顯示到畫面上
            LET g_qryparam.where = ""
            CALL asrt310_desc()
            NEXT FIELD sfda010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda011
            #add-point:ON ACTION controlp INFIELD sfda011 name="input.c.sfda011"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda011             #給予default值

            #給予arg
            IF NOT cl_null(g_sfda_m.sfda010) THEN
               LET g_qryparam.where = " bmba007 = '",g_sfda_m.sfda010,"'"
            END IF
            CALL q_bmba007()                                #呼叫開窗
            IF cl_null(g_sfda_m.sfda010) THEN
               LET g_sfda_m.sfda010 = g_qryparam.return1
            END IF
            LET g_sfda_m.sfda011 = g_qryparam.return2              #將開窗取得的值回傳到變數

            DISPLAY g_sfda_m.sfda011 TO sfda011              #顯示到畫面上
            LET g_qryparam.where = ""
            CALL asrt310_desc()
            NEXT FIELD sfda011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda012
            #add-point:ON ACTION controlp INFIELD sfda012 name="input.c.sfda012"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfda_m.sfda012             #給予default值

            #給予arg

            CALL q_inaa001_1()                                #呼叫開窗

            LET g_sfda_m.sfda012 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfda_m.sfda012 TO sfda012              #顯示到畫面上
            CALL asrt310_desc()
            NEXT FIELD sfda012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfda013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfda013
            #add-point:ON ACTION controlp INFIELD sfda013 name="input.c.sfda013"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sfda_m.sfdadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               IF g_mdemand = 'Y' THEN
                  NEXT FIELD sfddseq1
               END IF
               IF cl_null(g_sfda_m.sfda007) THEN
                     LET g_sfda_m.sfda007 = ' '
                  END IF
                  IF cl_null(g_sfda_m.sfda008) THEN
                     LET g_sfda_m.sfda008 = ' '
                  END IF
                  IF cl_null(g_sfda_m.sfda010) THEN
                     LET g_sfda_m.sfda010 = ' '
                  END IF
                  IF cl_null(g_sfda_m.sfda011) THEN
                     LET g_sfda_m.sfda011 = ' '
                  END IF
                  CALL asrt310_chk_srab() 
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_sfda_m.sfda006
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD sfda006
                  END IF
                  CALL asrt310_chk_bmba()
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_sfda_m.sfda006
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD sfda006
                  END IF
                  CALL s_aooi200_gen_docno(g_site,g_sfda_m.sfdadocno,g_sfda_m.sfdadocdt,g_prog) RETURNING l_success,g_sfda_m.sfdadocno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'apm-00003'
                     LET g_errparam.extend = g_sfda_m.sfdadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD sfdadocno
                  END IF
               LET g_sfda_m.sfdasite = g_site
               #end add-point
               
               INSERT INTO sfda_t (sfdaent,sfdadocno,sfdasite,sfdadocdt,sfda001,sfda004,sfda003,sfdastus, 
                   sfda002,sfda009,sfda006,sfda007,sfda008,sfda010,sfda011,sfda012,sfda013,sfdacrtid, 
                   sfdacrtdp,sfdacrtdt,sfdaownid,sfdaowndp,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid, 
                   sfdapstdt)
               VALUES (g_enterprise,g_sfda_m.sfdadocno,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001, 
                   g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002,g_sfda_m.sfda009, 
                   g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
                   g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt, 
                   g_sfda_m.sfdaownid,g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid, 
                   g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sfda_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
                              IF g_sfda_m.sfda013 > 0 THEN
                  CALL s_asrt310_sfdc_ins(g_sfda_m.sfdadocno,g_sfda_m.sfda002,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfdadocdt,g_sfda_m.sfda013,g_sfda_m.sfda010,g_sfda_m.sfda011,g_sfda_m.sfda012,'N')
                       RETURNING l_success,l_num 
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF  
                  CALL asrt310_show()                     
               END IF
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
                             
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL asrt310_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asrt310_b_fill()
                  CALL asrt310_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               IF g_mdemand = 'Y' THEN
                  NEXT FIELD sfddseq1
               END IF    
               IF cl_null(g_sfda_m.sfda007) THEN
                  LET g_sfda_m.sfda007 = ' '
               END IF
               IF cl_null(g_sfda_m.sfda008) THEN
                  LET g_sfda_m.sfda008 = ' '
               END IF
               IF cl_null(g_sfda_m.sfda010) THEN
                  LET g_sfda_m.sfda010 = ' '
               END IF
               IF cl_null(g_sfda_m.sfda011) THEN
                  LET g_sfda_m.sfda011 = ' '
               END IF
#               IF (g_sfda_m.sfda006 <> g_sfda_m_t.sfda006) OR (g_sfda_m.sfda007 <> g_sfda_m_t.sfda007) OR (g_sfda_m.sfda008 <> g_sfda_m_t.sfda008) OR (g_sfda_m.sfda009 <> g_sfda_m_t.sfda009) THEN
                  CALL asrt310_chk_srab()
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_sfda_m.sfda006
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD sfda006
                  END IF
#               END IF
               CALL asrt310_chk_bmba()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_sfda_m.sfda006
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                  NEXT FIELD sfda006
               END IF
               #end add-point
               
               #將遮罩欄位還原
               CALL asrt310_sfda_t_mask_restore('restore_mask_o')
               
               UPDATE sfda_t SET (sfdadocno,sfdasite,sfdadocdt,sfda001,sfda004,sfda003,sfdastus,sfda002, 
                   sfda009,sfda006,sfda007,sfda008,sfda010,sfda011,sfda012,sfda013,sfdacrtid,sfdacrtdp, 
                   sfdacrtdt,sfdaownid,sfdaowndp,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt) = (g_sfda_m.sfdadocno, 
                   g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003, 
                   g_sfda_m.sfdastus,g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007, 
                   g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda013, 
                   g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid,g_sfda_m.sfdaowndp, 
                   g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid, 
                   g_sfda_m.sfdapstdt)
                WHERE sfdaent = g_enterprise AND sfdadocno = g_sfdadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sfda_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               LET l_n1 = 0
               SELECT COUNT(*) INTO l_n1
                 FROM sfdc_t
                WHERE sfdcent = g_enterprise
                  AND sfdcdocno = g_sfda_m.sfdadocno
               IF g_sfda_m.sfda013 > 0 AND l_n1 = 0 THEN
                  CALL s_asrt310_sfdc_ins(g_sfda_m.sfdadocno,g_sfda_m.sfda002,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfdadocdt,g_sfda_m.sfda013,g_sfda_m.sfda010,g_sfda_m.sfda011,g_sfda_m.sfda012,'N')
                       RETURNING l_success,l_num 
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF  
                  CALL asrt310_show() 
                                
               END IF
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL asrt310_sfda_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sfda_m_t)
               LET g_log2 = util.JSON.stringify(g_sfda_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asrt310.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sfdc_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_sel1
            LET g_action_choice="s_lot_sel1"
            IF cl_auth_chk_act("s_lot_sel1") THEN
               
               #add-point:ON ACTION s_lot_sel1 name="input.detail_input.page1.s_lot_sel1"
               IF cl_null(g_detail_idx) OR g_detail_idx = 0 THEN
                  #单身缺少资料，不可维护！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'abm-00073'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
               
               IF g_sfda_m.sfdastus <> 'N' THEN
                  #此笔单据状态不是未审核,不可修改！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00035'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
                                
               IF cl_null(g_sfdc_d[g_detail_idx].sfdc012) THEN
                  #请先指定库位信息以便挑选批序号资料
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00691'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
               
               IF NOT cl_null(g_sfda_m.sfdadocno) AND
                  NOT cl_null(g_sfdc_d[g_detail_idx].sfdcseq) AND
                  NOT cl_null(g_sfdc_d[g_detail_idx].sfdc004) AND #料件
                  NOT cl_null(g_sfdc_d[g_detail_idx].sfdc006) AND #单位
                  NOT cl_null(g_sfdc_d[g_detail_idx].sfdc007) AND #数量
                  NOT cl_null(g_sfda_m.sfda004) AND               #申请人
                  NOT cl_null(g_sfdc_d[g_detail_idx].sfdc012)THEN  
                  LET l_success = ''
                  
                  #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                  IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                     CALL s_lot_sel('1','1',g_site,
                                    g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq,'1', #目的单号，项次，项序
                                    g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005,
                                    g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014,
                                    g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,'-1',g_prog,'',
                                    '','','','0' #来源单号，项次，项序,启用
                                    )
                          RETURNING l_success
                  ELSE #退料
                     #从当前单据中已产生的inao中选取退料资料
                     #              inao中抓 申请的资料 据点
                     CALL s_lot_sel('2','1',g_site,
                     #              目的单号            项次                           项序
                                    g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq,'1',
                     #              料件编号                        产品特征                        库存管理特征仓储批
                                    g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005,g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014,
                     #              退料单位                        数量
                                    g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,
                     #              出入库码 作业编号 据点
                                    '1',g_prog,'',
                     #              来源单号 项次 项序 启用来源单据
                                    '','','','1'
                                    )
                          RETURNING l_success 
                  END IF
                  #150826-00008#3
                  IF l_success THEN 
                     IF asrt310_ins_inao_2() THEN 
                     END IF
                  END IF
                  #150826-00008#3
                  CALL asrt310_b_fill_3()                       
               END IF   
               #END add-point
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION demand
            LET g_action_choice="demand"
            IF cl_auth_chk_act("demand") THEN
               
               #add-point:ON ACTION demand name="input.detail_input.page1.demand"
               LET l_n1 = 0
               SELECT COUNT(*) INTO l_n1
                 FROM sfdc_t
                WHERE sfdcent = g_enterprise
                  AND sfdcdocno = g_sfda_m.sfdadocno
               IF l_n1 > 0 THEN
                  IF cl_ask_confirm('asr-00007') THEN
                     DELETE FROM sfdc_t
                      WHERE sfdcent = g_enterprise
                        AND sfdcdocno = g_sfda_m.sfdadocno
                     DELETE FROM sfdd_t
                      WHERE sfddent = g_enterprise
                        AND sfdddocno = g_sfda_m.sfdadocno 
                     CALL s_asrt310_update_inao('2','2',g_sfda_m.sfdadocno,'','') RETURNING l_success                         
                  END IF
               END IF   
               CALL s_transaction_begin()
               CALL s_asrt310_sfdc_ins(g_sfda_m.sfdadocno,g_sfda_m.sfda002,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfdadocdt,g_sfda_m.sfda013,g_sfda_m.sfda010,g_sfda_m.sfda011,g_sfda_m.sfda012,'N')
                    RETURNING l_success,l_num 
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF         
               CALL asrt310_show()               
               #END add-point
            END IF
 
 
 
 
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfdc_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt310_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sfdc_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            IF g_mdemand = 'Y' THEN
               NEXT FIELD sfddseq1
            END IF
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
            OPEN asrt310_cl USING g_enterprise,g_sfda_m.sfdadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt310_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt310_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfdc_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfdc_d[l_ac].sfdcseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sfdc_d_t.* = g_sfdc_d[l_ac].*  #BACKUP
               LET g_sfdc_d_o.* = g_sfdc_d[l_ac].*  #BACKUP
               CALL asrt310_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL asrt310_set_no_entry_b(l_cmd)
               IF NOT asrt310_lock_b("sfdc_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt310_bcl INTO g_sfdc_d[l_ac].sfdcsite,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d[l_ac].sfdc004, 
                      g_sfdc_d[l_ac].sfdc005,g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,g_sfdc_d[l_ac].sfdc008, 
                      g_sfdc_d[l_ac].sfdc009,g_sfdc_d[l_ac].sfdc010,g_sfdc_d[l_ac].sfdc011,g_sfdc_d[l_ac].sfdc012, 
                      g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc015 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sfdc_d_t.sfdcseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfdc_d_mask_o[l_ac].* =  g_sfdc_d[l_ac].*
                  CALL asrt310_sfdc_t_mask()
                  LET g_sfdc_d_mask_n[l_ac].* =  g_sfdc_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt310_show()
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
            INITIALIZE g_sfdc_d[l_ac].* TO NULL 
            INITIALIZE g_sfdc_d_t.* TO NULL 
            INITIALIZE g_sfdc_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_sfdc_d[l_ac].imae092 = "Y"
      LET g_sfdc_d[l_ac].sfdc008 = "0"
      LET g_sfdc_d[l_ac].sfdc011 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_sfdc_d_t.* = g_sfdc_d[l_ac].*     #新輸入資料
            LET g_sfdc_d_o.* = g_sfdc_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt310_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL asrt310_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfdc_d[li_reproduce_target].* = g_sfdc_d[li_reproduce].*
 
               LET g_sfdc_d[li_reproduce_target].sfdcseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
                        LET g_sfdc_d[l_ac].sfdc012 = g_sfda_m.sfda012
            SELECT MAX(sfdcseq) +1 INTO g_sfdc_d[l_ac].sfdcseq
              FROM sfdc_t
             WHERE sfdcent = g_enterprise
               AND sfdcdocno = g_sfda_m.sfdadocno
            IF cl_null(g_sfdc_d[l_ac].sfdcseq) THEN
               LET g_sfdc_d[l_ac].sfdcseq = 1
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
            SELECT COUNT(1) INTO l_count FROM sfdc_t 
             WHERE sfdcent = g_enterprise AND sfdcdocno = g_sfda_m.sfdadocno
 
               AND sfdcseq = g_sfdc_d[l_ac].sfdcseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
                              LET g_sfdc_d[g_detail_idx].sfdcsite = g_site
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfda_m.sfdadocno
               LET gs_keys[2] = g_sfdc_d[g_detail_idx].sfdcseq
               CALL asrt310_insert_b('sfdc_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sfdc_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfdc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt310_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
#               CALL asrt310_b_fill_1()
#               DISPLAY ARRAY g_sfdc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b1)   
#    
#                  BEFORE DISPLAY
#                    EXIT DISPLAY
#               END DISPLAY
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               CALL s_transaction_end('N','0')  #151009
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
               LET gs_keys[01] = g_sfda_m.sfdadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_sfdc_d_t.sfdcseq
 
            
               #刪除同層單身
               IF NOT asrt310_delete_b('sfdc_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt310_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt310_key_delete_b(gs_keys,'sfdc_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt310_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
 
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt310_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                  
               #end add-point
               LET l_count = g_sfdc_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
            
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfdc_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdcseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfdc_d[l_ac].sfdcseq,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sfdcseq
            END IF 
 
 
 
            #add-point:AFTER FIELD sfdcseq name="input.a.page1.sfdcseq"
                        #此段落由子樣板a05產生
            IF NOT cl_null(g_sfda_m.sfdadocno) AND NOT cl_null(g_sfdc_d[l_ac].sfdcseq) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfda_m.sfdadocno != g_sfdadocno_t OR g_sfdc_d[l_ac].sfdcseq != g_sfdc_d_t.sfdcseq)) THEN 
                  IF NOT ap_chk_notDup(g_sfdc_d[l_ac].sfdcseq,"SELECT COUNT(*) FROM sfdc_t WHERE "||"sfdcent = '" ||g_enterprise|| "'  AND "||"sfdcdocno = '"||g_sfda_m.sfdadocno ||"' AND "|| "sfdcseq = '"||g_sfdc_d[l_ac].sfdcseq ||"'",'std-00004',0) THEN 
                     LET g_sfdc_d[l_ac].sfdcseq = g_sfdc_d_t.sfdcseq
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdcseq
            #add-point:BEFORE FIELD sfdcseq name="input.b.page1.sfdcseq"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdcseq
            #add-point:ON CHANGE sfdcseq name="input.g.page1.sfdcseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc004
            
            #add-point:AFTER FIELD sfdc004 name="input.a.page1.sfdc004"
                        CALL asrt310_sfdc_desc()
            IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfdc_d[l_ac].sfdc004

               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_imaf001_1") THEN
                  LET g_sfdc_d[l_ac].sfdc004 = g_sfdc_d_t.sfdc004
                  CALL asrt310_sfdc_desc()
                  NEXT FIELD sfdc004
               END IF
               CALL asrt310_chk_sfdc004()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfdc_d[l_ac].sfdc004
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfdc_d[l_ac].sfdc004 = g_sfdc_d_t.sfdc004
                  CALL asrt310_sfdc_desc()
                  NEXT FIELD sfdc004
               END IF
               IF NOT cl_null(g_sfdc_d[l_ac].sfdc012) THEN
                  CALL asrt310_chk_sfdc012() RETURNING l_sys
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfdc_d[l_ac].sfdc004
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                     IF l_sys = '1' THEN
                        LET g_sfdc_d[l_ac].sfdc004 = g_sfdc_d_t.sfdc004
                        CALL asrt310_sfdc_desc()
                        NEXT FIELD sfdc004
                     END IF
                  END IF
               END IF
               IF l_cmd = 'a' THEN
                  CALL asrt310_sfdc004_def()
               END IF
               CALL asrt310_set_entry_b(l_cmd)
               CALL asrt310_set_no_required_b(l_cmd)
               CALL asrt310_set_required_b(l_cmd)
               CALL asrt310_set_no_entry_b(l_cmd)
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc004
            #add-point:BEFORE FIELD sfdc004 name="input.b.page1.sfdc004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc004
            #add-point:ON CHANGE sfdc004 name="input.g.page1.sfdc004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc005
            
            #add-point:AFTER FIELD sfdc005 name="input.a.page1.sfdc005"
            CALL s_feature_description(g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005) RETURNING g_success,g_sfdc_d[l_ac].sfdc005_desc   #160202-00010#1
            IF NOT cl_null(g_sfdc_d[l_ac].sfdc005) THEN
               #160202-00010#1---mod---b
               #CALL asrt310_chk_sfdc005()
               #IF NOT cl_null(g_errno) THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code = g_errno
               #   LET g_errparam.extend = g_sfdc_d[l_ac].sfdc005
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #
               #   LET g_sfdc_d[l_ac].sfdc005 = g_sfdc_d_t.sfdc005
               #   NEXT FIELD sfdc005
               #END IF
               IF NOT s_feature_check(g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005) THEN 
                   LET g_sfdc_d[l_ac].sfdc005 = g_sfdc_d_t.sfdc005 
                   NEXT FIELD CURRENT
                END IF               
               #160202-00010#1---mod---e
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc005
            #add-point:BEFORE FIELD sfdc005 name="input.b.page1.sfdc005"
            #160202-00010#1---b
            IF s_feature_auto_chk(g_sfdc_d[l_ac].sfdc004) THEN #160314-00009#14 add
               IF asrt310_imaa005_exists() THEN 
                  IF cl_null(g_sfdc_d[l_ac].sfdc005) THEN
                     CALL s_feature_single(g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,g_site,'') RETURNING l_success,g_sfdc_d[l_ac].sfdc005
                     DISPLAY BY NAME g_sfdc_d[l_ac].sfdc005
                     #CALL s_transaction_begin()   #102151214-xianghui-mark
                  END IF        
               END IF
               CALL s_feature_description(g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005) RETURNING g_success,g_sfdc_d[l_ac].sfdc005_desc
            END IF       #160314-00009#14 add
            #160202-00010#1---e
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc005
            #add-point:ON CHANGE sfdc005 name="input.g.page1.sfdc005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc005_desc
            #add-point:BEFORE FIELD sfdc005_desc name="input.b.page1.sfdc005_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc005_desc
            
            #add-point:AFTER FIELD sfdc005_desc name="input.a.page1.sfdc005_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc005_desc
            #add-point:ON CHANGE sfdc005_desc name="input.g.page1.sfdc005_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaf034
            #add-point:BEFORE FIELD imaf034 name="input.b.page1.imaf034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imaf034
            
            #add-point:AFTER FIELD imaf034 name="input.a.page1.imaf034"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE imaf034
            #add-point:ON CHANGE imaf034 name="input.g.page1.imaf034"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imae092
            #add-point:BEFORE FIELD imae092 name="input.b.page1.imae092"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imae092
            
            #add-point:AFTER FIELD imae092 name="input.a.page1.imae092"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE imae092
            #add-point:ON CHANGE imae092 name="input.g.page1.imae092"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc006
            #add-point:BEFORE FIELD sfdc006 name="input.b.page1.sfdc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc006
            
            #add-point:AFTER FIELD sfdc006 name="input.a.page1.sfdc006"
                        
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc006
            #add-point:ON CHANGE sfdc006 name="input.g.page1.sfdc006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc007
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfdc_d[l_ac].sfdc007,"0.000000","0","","","azz-00079",1) THEN
               NEXT FIELD sfdc007
            END IF 
 
 
 
            #add-point:AFTER FIELD sfdc007 name="input.a.page1.sfdc007"
            IF NOT cl_null(g_sfdc_d[l_ac].sfdc007) THEN 
               LET g_sfdc_d[l_ac].sfdc008_desc = g_sfdc_d[l_ac].sfdc007 - g_sfdc_d[l_ac].sfdc008
               DISPLAY BY NAME g_sfdc_d[l_ac].sfdc008_desc
               #add 151009-xianghui -add
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt FROM inao_t WHERE inaoent = g_enterprise AND inaodocno = g_sfda_m.sfdadocno AND inao000 = '1' AND inaoseq = g_sfdc_d[l_ac].sfdcseq           
               IF g_sfdc_d[l_ac].sfdc007 <> g_sfdc_d_o.sfdc007 OR cl_null(g_sfdc_d_o.sfdc007) OR l_cnt =0 THEN 
                  #IF g_prog = 'asrt310' AND g_sfdc_d[l_ac].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                  IF g_prog MATCHES 'asrt310' AND g_sfdc_d[l_ac].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                     CALL s_lot_sel('1','1',g_site,
                                    g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                    g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                    g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                    g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                    '','','','0' #来源单号，项次，项序,启用
                                    )
                          RETURNING l_success
                  ELSE #退料
                     #从当前单据中已产生的inao中选取退料资料
                     #              inao中抓 申请的资料 据点
                     CALL s_lot_sel('2','1',g_site,
                     #              目的单号            项次                           项序
                                    g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',
                     #              料件编号                产品特征              库存管理特征仓储批
                                    g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                     #              退料单位                        数量
                                    g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,
                     #              出入库码 作业编号 据点
                                    '1',g_prog,'',
                     #              来源单号 项次 项序 启用来源单据
                                    '','','','1'
                                    )
                          RETURNING l_success 
                  END IF
                  
                  IF l_success THEN     #150826-00008#3             
                     IF asrt310_ins_inao_2() THEN 
                     END IF
                  END IF                #150826-00008#3
                  CALL asrt310_b_fill_3()                  
               END IF 
               #add 151009               
            END IF 
            LET g_sfdc_d_o.sfdc007 = g_sfdc_d[l_ac].sfdc007    #add 151009 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc007
            #add-point:BEFORE FIELD sfdc007 name="input.b.page1.sfdc007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc007
            #add-point:ON CHANGE sfdc007 name="input.g.page1.sfdc007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc008
            
            #add-point:AFTER FIELD sfdc008 name="input.a.page1.sfdc008"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc008
            #add-point:BEFORE FIELD sfdc008 name="input.b.page1.sfdc008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc008
            #add-point:ON CHANGE sfdc008 name="input.g.page1.sfdc008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc008_desc
            #add-point:BEFORE FIELD sfdc008_desc name="input.b.page1.sfdc008_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc008_desc
            
            #add-point:AFTER FIELD sfdc008_desc name="input.a.page1.sfdc008_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc008_desc
            #add-point:ON CHANGE sfdc008_desc name="input.g.page1.sfdc008_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc009
            #add-point:BEFORE FIELD sfdc009 name="input.b.page1.sfdc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc009
            
            #add-point:AFTER FIELD sfdc009 name="input.a.page1.sfdc009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc009
            #add-point:ON CHANGE sfdc009 name="input.g.page1.sfdc009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc010
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfdc_d[l_ac].sfdc010,"0.00000","1","","","azz-00079",1) THEN
               NEXT FIELD sfdc010
            END IF 
 
 
 
            #add-point:AFTER FIELD sfdc010 name="input.a.page1.sfdc010"
                        IF NOT cl_null(g_sfdc_d[l_ac].sfdc010) THEN 
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc010
            #add-point:BEFORE FIELD sfdc010 name="input.b.page1.sfdc010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc010
            #add-point:ON CHANGE sfdc010 name="input.g.page1.sfdc010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc011
            
            #add-point:AFTER FIELD sfdc011 name="input.a.page1.sfdc011"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc011
            #add-point:BEFORE FIELD sfdc011 name="input.b.page1.sfdc011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc011
            #add-point:ON CHANGE sfdc011 name="input.g.page1.sfdc011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc011_desc
            #add-point:BEFORE FIELD sfdc011_desc name="input.b.page1.sfdc011_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc011_desc
            
            #add-point:AFTER FIELD sfdc011_desc name="input.a.page1.sfdc011_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc011_desc
            #add-point:ON CHANGE sfdc011_desc name="input.g.page1.sfdc011_desc"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc012
            
            #add-point:AFTER FIELD sfdc012 name="input.a.page1.sfdc012"
            CALL asrt310_sfdc_desc()
            IF NOT cl_null(g_sfdc_d[l_ac].sfdc012) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfdc_d[l_ac].sfdc012
               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
              #160318-00025#22  by 07900 --add-end 
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_inaa001_2") THEN
                  LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                  CALL asrt310_sfdc_desc()
                  NEXT FIELD CURRENT
               END IF
               
               CALL asrt310_chk_sfdc012() RETURNING l_sys
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfdc_d[l_ac].sfdc012
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_sys = '1' THEN
                     LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                     CALL asrt310_sfdc_desc()
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF NOT cl_null(g_sfdc_d[l_ac].sfdc013) THEN
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
            
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_sfdc_d[l_ac].sfdc012
                  LET g_chkparam.arg3 = g_sfdc_d[l_ac].sfdc013
                  #160318-00025#22  by 07900 --add-str
                 LET g_errshow = TRUE #是否開窗                   
                 LET g_chkparam.err_str[1] ="aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002"
                 #160318-00025#22  by 07900 --add-end
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_inab002") THEN
                     LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                     CALL asrt310_sfdc_desc()
                     NEXT FIELD CURRENT
                  END IF
               END IF 
               #151009-xianghui-add-b
              #IF s_lot_batch_number(g_sfdc_d[l_ac].sfdc004,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfdc_d[l_ac].sfdc004,g_site) THEN  #160314-00008#1 add
                  IF g_sfdc_d[l_ac].sfdc012 <> g_sfdc_d_o.sfdc012 OR g_sfdc_d_o.sfdc012 IS NULL OR
                     g_sfdc_d[l_ac].sfdc013 <> g_sfdc_d_o.sfdc013 OR g_sfdc_d_o.sfdc013 IS NULL OR
                     g_sfdc_d[l_ac].sfdc014 <> g_sfdc_d_o.sfdc014 OR g_sfdc_d_o.sfdc014 IS NULL THEN 
                     #IF g_prog = 'asrt310' THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' THEN  #发料   #160705-00042#10 160713 by sakura add
                        LET l_cnt = 0
                        CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',' ',g_site) RETURNING l_success,l_cnt
                        IF l_cnt > 0 THEN                      
                           IF l_success THEN
                              #刪除資料                              
                              DELETE FROM inao_t 
                               WHERE inaoent = g_enterprise 
                                 AND inaosite = g_site
                                 AND inaodocno = g_sfda_m.sfdadocno
                                 AND inaoseq = g_sfdc_d[l_ac].sfdcseq                                  
                              CALL s_lot_sel('1','1',g_site,
                                             g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                             g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                             g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                             g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                             '','','','0' #来源单号，项次，项序,启用
                                             )
                                   RETURNING l_success
                           ELSE
                              LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                              LET g_sfdc_d[l_ac].sfdc013 = g_sfdc_d_t.sfdc013
                              LET g_sfdc_d[l_ac].sfdc014 = g_sfdc_d_t.sfdc014
                              CALL asrt310_sfdc_desc()
                           END IF
                        ELSE
                           CALL s_lot_sel('1','1',g_site,
                                          g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                          g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                          g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                          g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                          '','','','0' #来源单号，项次，项序,启用
                                          )
                                RETURNING l_success                                             
                        END IF
                     ELSE #退料
#                        #从当前单据中已产生的inao中选取退料资料
#                        #              inao中抓 申请的资料 据点
#                        CALL s_lot_sel('2','1',g_site,
#                        #              目的单号            项次                           项序
#                                       g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',
#                        #              料件编号                产品特征              库存管理特征仓储批
#                                       g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,'','','','',
#                        #              退料单位                        数量
#                                       g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,
#                        #              出入库码 作业编号 据点
#                                       '1',g_prog,'',
#                        #              来源单号 项次 项序 启用来源单据
#                                       '','','','1'
#                                       )
#                             RETURNING l_success 
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'1',g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,g_site,g_sfdc_d[l_ac].sfdc016)   #160316-00007#7 add sfdc016   
                           RETURNING l_success 
                     END IF
                     
                     #150826-00008#3
                     IF l_success THEN 
                        IF asrt310_ins_inao_2() THEN 
                        END IF
                     END IF
                     #150826-00008#3
                     CALL asrt310_b_fill_3()                  
                  END IF 
               END IF
               #151009-xianghui-add-e               
            END IF
            LET g_sfdc_d_o.sfdc012 = g_sfdc_d[l_ac].sfdc012   #151009-xianghui-add
            LET g_sfdc_d_o.sfdc013 = g_sfdc_d[l_ac].sfdc013   #151009-xianghui-add
            LET g_sfdc_d_o.sfdc014 = g_sfdc_d[l_ac].sfdc014   #151009-xianghui-add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc012
            #add-point:BEFORE FIELD sfdc012 name="input.b.page1.sfdc012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc012
            #add-point:ON CHANGE sfdc012 name="input.g.page1.sfdc012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc013
            
            #add-point:AFTER FIELD sfdc013 name="input.a.page1.sfdc013"
                        CALL asrt310_sfdc_desc()
            IF NOT cl_null(g_sfdc_d[l_ac].sfdc013) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
    
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_site
               LET g_chkparam.arg2 = g_sfdc_d[l_ac].sfdc012
               LET g_chkparam.arg3 = g_sfdc_d[l_ac].sfdc013
               #160318-00025#22  by 07900 --add-str
              LET g_errshow = TRUE #是否開窗                   
              LET g_chkparam.err_str[1] ="aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002"
              #160318-00025#22  by 07900 --add-end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_inab002") THEN
                  LET g_sfdc_d[l_ac].sfdc013 = g_sfdc_d_t.sfdc013
                  CALL asrt310_sfdc_desc()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #151009-xianghui-add-b
            IF cl_null(g_sfdc_d[l_ac].sfdc013) THEN 
               LET g_sfdc_d[l_ac].sfdc013 = ' ' 
            END IF
            IF cl_null(g_sfdc_d[l_ac].sfdc014) THEN 
               LET g_sfdc_d[l_ac].sfdc014 = ' ' 
            END IF            
            IF g_sfdc_d[l_ac].sfdc013 IS NOT NULL THEN 
              #IF s_lot_batch_number(g_sfdc_d[l_ac].sfdc004,g_site) THEN     #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfdc_d[l_ac].sfdc004,g_site) THEN #160314-00008#1 add
                  IF g_sfdc_d[l_ac].sfdc012 <> g_sfdc_d_o.sfdc012 OR g_sfdc_d_o.sfdc012 IS NULL OR
                     g_sfdc_d[l_ac].sfdc013 <> g_sfdc_d_o.sfdc013 OR g_sfdc_d_o.sfdc013 IS NULL OR
                     g_sfdc_d[l_ac].sfdc014 <> g_sfdc_d_o.sfdc014 OR g_sfdc_d_o.sfdc014 IS NULL THEN 
                     #IF g_prog = 'asrt310' THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' THEN  #发料   #160705-00042#10 160713 by sakura add
                        LET l_cnt = 0
                        CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',' ',g_site) RETURNING l_success,l_cnt
                        IF l_cnt > 0 THEN                      
                           IF l_success THEN
                              #刪除資料                              
                              DELETE FROM inao_t 
                               WHERE inaoent = g_enterprise 
                                 AND inaosite = g_site
                                 AND inaodocno = g_sfda_m.sfdadocno
                                 AND inaoseq = g_sfdc_d[l_ac].sfdcseq                           
                              CALL s_lot_sel('1','1',g_site,
                                             g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                             g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                             g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                             g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                             '','','','0' #来源单号，项次，项序,启用
                                             )
                                   RETURNING l_success
                           ELSE
                              LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                              LET g_sfdc_d[l_ac].sfdc013 = g_sfdc_d_t.sfdc013
                              LET g_sfdc_d[l_ac].sfdc014 = g_sfdc_d_t.sfdc014
                              CALL asrt310_sfdc_desc()
                           END IF
                        ELSE
                           CALL s_lot_sel('1','1',g_site,
                                          g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                          g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                          g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                          g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                          '','','','0' #来源单号，项次，项序,启用
                                          )
                                RETURNING l_success                                             
                        END IF
                     ELSE #退料
#                        #从当前单据中已产生的inao中选取退料资料
#                        #              inao中抓 申请的资料 据点
#                        CALL s_lot_sel('2','1',g_site,
#                        #              目的单号            项次                           项序
#                                       g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',
#                        #              料件编号                产品特征              库存管理特征仓储批
#                                       g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,'','','','',
#                        #              退料单位                        数量
#                                       g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,
#                        #              出入库码 作业编号 据点
#                                       '1',g_prog,'',
#                        #              来源单号 项次 项序 启用来源单据
#                                       '','','','1'
#                                       )
#                             RETURNING l_success 
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'1',g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,g_site,g_sfdc_d[l_ac].sfdc016)  #160316-00007#7 add sfdc016 
                           RETURNING l_success                               
                     END IF
                     
                     
                     #150826-00008#3
                     IF l_success THEN 
                        IF asrt310_ins_inao_2() THEN 
                        END IF
                     END IF
                     #150826-00008#3
                     CALL asrt310_b_fill_3()                  
                  END IF 
               END IF
            END IF  
            LET g_sfdc_d_o.sfdc012 = g_sfdc_d[l_ac].sfdc012   
            LET g_sfdc_d_o.sfdc013 = g_sfdc_d[l_ac].sfdc013   
            LET g_sfdc_d_o.sfdc014 = g_sfdc_d[l_ac].sfdc014            
            #151009-xianghui-add-e              
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc013
            #add-point:BEFORE FIELD sfdc013 name="input.b.page1.sfdc013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc013
            #add-point:ON CHANGE sfdc013 name="input.g.page1.sfdc013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc014
            #add-point:BEFORE FIELD sfdc014 name="input.b.page1.sfdc014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc014
            
            #add-point:AFTER FIELD sfdc014 name="input.a.page1.sfdc014"
            #151009-xianghui-add-b
            IF cl_null(g_sfdc_d[l_ac].sfdc013) THEN 
               LET g_sfdc_d[l_ac].sfdc013 = ' ' 
            END IF            
            IF cl_null(g_sfdc_d[l_ac].sfdc014) THEN 
               LET g_sfdc_d[l_ac].sfdc014 = ' ' 
            END IF
            IF g_sfdc_d[l_ac].sfdc014 IS NOT NULL THEN 
              #IF s_lot_batch_number(g_sfdc_d[l_ac].sfdc004,g_site) THEN     #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfdc_d[l_ac].sfdc004,g_site) THEN #160314-00008#1 add
                  IF g_sfdc_d[l_ac].sfdc012 <> g_sfdc_d_o.sfdc012 OR g_sfdc_d_o.sfdc012 IS NULL OR
                     g_sfdc_d[l_ac].sfdc013 <> g_sfdc_d_o.sfdc013 OR g_sfdc_d_o.sfdc013 IS NULL OR
                     g_sfdc_d[l_ac].sfdc014 <> g_sfdc_d_o.sfdc014 OR g_sfdc_d_o.sfdc014 IS NULL THEN 
                     #IF g_prog = 'asrt310' THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' THEN  #发料   #160705-00042#10 160713 by sakura add
                        LET l_cnt = 0
                        CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',' ',g_site) RETURNING l_success,l_cnt
                        IF l_cnt > 0 THEN                      
                           IF l_success THEN
                              #刪除資料                              
                              DELETE FROM inao_t 
                               WHERE inaoent = g_enterprise 
                                 AND inaosite = g_site
                                 AND inaodocno = g_sfda_m.sfdadocno
                                 AND inaoseq = g_sfdc_d[l_ac].sfdcseq                           
                              CALL s_lot_sel('1','1',g_site,
                                             g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                             g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                             g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                             g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                             '','','','0' #来源单号，项次，项序,启用
                                             )
                                   RETURNING l_success
                           ELSE
                              LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                              LET g_sfdc_d[l_ac].sfdc013 = g_sfdc_d_t.sfdc013
                              LET g_sfdc_d[l_ac].sfdc014 = g_sfdc_d_t.sfdc014
                              CALL asrt310_sfdc_desc()
                           END IF
                        ELSE
                           CALL s_lot_sel('1','1',g_site,
                                          g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                          g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                          g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                          g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                          '','','','0' #来源单号，项次，项序,启用
                                          )
                                RETURNING l_success                                             
                        END IF
                     ELSE #退料
#                        #从当前单据中已产生的inao中选取退料资料
#                        #              inao中抓 申请的资料 据点
#                        CALL s_lot_sel('2','1',g_site,
#                        #              目的单号            项次                           项序
#                                       g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',
#                        #              料件编号                产品特征              库存管理特征仓储批
#                                       g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,'','','','',
#                        #              退料单位                        数量
#                                       g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,
#                        #              出入库码 作业编号 据点
#                                       '1',g_prog,'',
#                        #              来源单号 项次 项序 启用来源单据
#                                       '','','','1'
#                                       )
#                             RETURNING l_success 
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'1',g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,g_site,g_sfdc_d[l_ac].sfdc016)   #160316-00007#7 add sfdc016 
                           RETURNING l_success                              
                     END IF
                     
                     
                     #150826-00008#3
                     IF l_success THEN 
                        IF asrt310_ins_inao_2() THEN 
                        END IF
                     END IF
                     #150826-00008#3
                     CALL asrt310_b_fill_3()                  
                  END IF 
               END IF
            END IF  
            LET g_sfdc_d_o.sfdc012 = g_sfdc_d[l_ac].sfdc012   
            LET g_sfdc_d_o.sfdc013 = g_sfdc_d[l_ac].sfdc013   
            LET g_sfdc_d_o.sfdc014 = g_sfdc_d[l_ac].sfdc014           
            #151009-xianghui-add-e            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc014
            #add-point:ON CHANGE sfdc014 name="input.g.page1.sfdc014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc016
            #add-point:BEFORE FIELD sfdc016 name="input.b.page1.sfdc016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc016
            
            #add-point:AFTER FIELD sfdc016 name="input.a.page1.sfdc016"
            #160316-00007#7---add---begin
            IF cl_null(g_sfdc_d[l_ac].sfdc016) THEN 
               LET g_sfdc_d[l_ac].sfdc016 = ' ' 
            END IF            
            IF g_sfdc_d[l_ac].sfdc016 IS NOT NULL THEN 
               IF s_lot_batch_number_1n3(g_sfdc_d[l_ac].sfdc004,g_site) THEN 
                  IF g_sfdc_d[l_ac].sfdc016 <> g_sfdc_d_o.sfdc016 OR g_sfdc_d_o.sfdc016 IS NULL THEN 
                     #IF g_prog = 'asrt310' THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' THEN  #发料   #160705-00042#10 160713 by sakura add
                        LET l_cnt = 0
                        CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1',' ',g_site) RETURNING l_success,l_cnt
                        IF l_cnt > 0 THEN                      
                           IF l_success THEN
                              #刪除資料                              
                              DELETE FROM inao_t 
                               WHERE inaoent = g_enterprise 
                                 AND inaosite = g_site
                                 AND inaodocno = g_sfda_m.sfdadocno
                                 AND inaoseq = g_sfdc_d[l_ac].sfdcseq                           
                              CALL s_lot_sel('1','1',g_site,
                                             g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                             g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                             g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                             g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                             '','','','0' #来源单号，项次，项序,启用
                                             )
                                   RETURNING l_success
                           ELSE
                              LET g_sfdc_d[l_ac].sfdc012 = g_sfdc_d_t.sfdc012
                              LET g_sfdc_d[l_ac].sfdc013 = g_sfdc_d_t.sfdc013
                              LET g_sfdc_d[l_ac].sfdc014 = g_sfdc_d_t.sfdc014
                              CALL asrt310_sfdc_desc()
                           END IF
                        ELSE
                           CALL s_lot_sel('1','1',g_site,
                                          g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'1', #目的单号，项次，项序
                                          g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,
                                          g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,
                                          g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,'-1',g_prog,'',
                                          '','','','0' #来源单号，项次，项序,启用
                                          )
                                RETURNING l_success                                             
                        END IF
                     ELSE #退料 
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'1',g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,g_site,g_sfdc_d[l_ac].sfdc016)
                           RETURNING l_success                              
                     END IF

                     IF l_success THEN 
                        IF asrt310_ins_inao_2() THEN 
                        END IF
                     END IF
                     CALL asrt310_b_fill_3()                  
                  END IF 
               END IF
            END IF  
            LET g_sfdc_d_o.sfdc016 = g_sfdc_d[l_ac].sfdc016             
            #160316-00007#7---add---end                        
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc016
            #add-point:ON CHANGE sfdc016 name="input.g.page1.sfdc016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfdc015
            
            #add-point:AFTER FIELD sfdc015 name="input.a.page1.sfdc015"
                        CALL asrt310_sfdc_desc()
            IF NOT cl_null(g_sfdc_d[l_ac].sfdc015) THEN
               CALL s_azzi650_chk_exist(g_acc,g_sfdc_d[l_ac].sfdc015) RETURNING l_success
               IF NOT l_success THEN
                  LET g_sfdc_d[l_ac].sfdc015 = g_sfdc_d_t.sfdc015
                  CALL asrt310_sfdc_desc()
                  NEXT FIELD CURRENT
               END IF
            END IF

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfdc015
            #add-point:BEFORE FIELD sfdc015 name="input.b.page1.sfdc015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfdc015
            #add-point:ON CHANGE sfdc015 name="input.g.page1.sfdc015"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sfdcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdcseq
            #add-point:ON ACTION controlp INFIELD sfdcseq name="input.c.page1.sfdcseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc004
            #add-point:ON ACTION controlp INFIELD sfdc004 name="input.c.page1.sfdc004"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc004             #給予default值

            #給予arg
            SELECT srza007 INTO l_srza007
              FROM srza_t
             WHERE srzaent = g_enterprise
               AND srzasite = g_site
               AND srza001 = g_sfda_m.sfda009
            IF l_srza007 = '1' THEN
               LET g_qryparam.where = " imaf001 IN (SELECT bmba003 FROM (SELECT bmba001,bmba003 FROM (SELECT bmba001,bmba002,bmba003 FROM bmba_t WHERE bmbaent = '",g_enterprise,"' AND bmbasite = '",g_site,"') ",
                                      "     START WITH bmba001 ='",g_sfda_m.sfda006,"' AND bmba002 ='",g_sfda_m.sfda007,"' ",
                                      "     CONNECT BY PRIOR bmba003 = bmba001 ORDER BY bmba001))"                         
            END IF
            CALL q_imaf001_6()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc004 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfdc_d[l_ac].sfdc004 TO sfdc004              #顯示到畫面上
            LET g_qryparam.where = ""
            CALL asrt310_sfdc_desc()
            NEXT FIELD sfdc004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc005
            #add-point:ON ACTION controlp INFIELD sfdc005 name="input.c.page1.sfdc005"
            #160202-00010#1---b
            CALL s_feature_single(g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,g_site,'') RETURNING l_success,g_sfdc_d[l_ac].sfdc005     #呼叫開窗
            DISPLAY g_sfdc_d[l_ac].sfdc005 TO sfdc005   #顯示到畫面上
            NEXT FIELD CURRENT
            #160202-00010#1---e            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc005_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc005_desc
            #add-point:ON ACTION controlp INFIELD sfdc005_desc name="input.c.page1.sfdc005_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.imaf034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaf034
            #add-point:ON ACTION controlp INFIELD imaf034 name="input.c.page1.imaf034"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.imae092
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imae092
            #add-point:ON ACTION controlp INFIELD imae092 name="input.c.page1.imae092"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc006
            #add-point:ON ACTION controlp INFIELD sfdc006 name="input.c.page1.sfdc006"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc006             #給予default值

            #給予arg

            CALL q_ooca001_1()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc006 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfdc_d[l_ac].sfdc006 TO sfdc006              #顯示到畫面上
            NEXT FIELD sfdc006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc007
            #add-point:ON ACTION controlp INFIELD sfdc007 name="input.c.page1.sfdc007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc008
            #add-point:ON ACTION controlp INFIELD sfdc008 name="input.c.page1.sfdc008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc008_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc008_desc
            #add-point:ON ACTION controlp INFIELD sfdc008_desc name="input.c.page1.sfdc008_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc009
            #add-point:ON ACTION controlp INFIELD sfdc009 name="input.c.page1.sfdc009"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc009             #給予default值

            #給予arg

            CALL q_ooca001_1()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfdc_d[l_ac].sfdc009 TO sfdc009              #顯示到畫面上

            NEXT FIELD sfdc009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc010
            #add-point:ON ACTION controlp INFIELD sfdc010 name="input.c.page1.sfdc010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc011
            #add-point:ON ACTION controlp INFIELD sfdc011 name="input.c.page1.sfdc011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc011_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc011_desc
            #add-point:ON ACTION controlp INFIELD sfdc011_desc name="input.c.page1.sfdc011_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc012
            #add-point:ON ACTION controlp INFIELD sfdc012 name="input.c.page1.sfdc012"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc012             #給予default值
            #給予arg
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            #給予arg
            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc012             #給予default值
            LET g_qryparam.default2 = g_sfdc_d[l_ac].sfdc013
            LET g_qryparam.default3 = g_sfdc_d[l_ac].sfdc014
            LET g_qryparam.default4 = g_sfdc_d[l_ac].sfdc016
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d[l_ac].sfdc004,"'"
            #160304-00022#1---add---begin
            IF g_sfdc_d[l_ac].sfdc005 IS NOT NULL THEN 
               LET g_qryparam.where = g_qryparam.where," AND inag002 = '",g_sfdc_d[l_ac].sfdc005,"'"
            END IF
            #160304-00022#1---add---end
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d[l_ac].sfdc013 = g_qryparam.return2
            LET g_sfdc_d[l_ac].sfdc014 = g_qryparam.return3
            LET g_sfdc_d[l_ac].sfdc016 = g_qryparam.return4


            LET g_sfdc_d[l_ac].sfdc012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_sfdc_d[l_ac].sfdc012 TO sfdc012              #顯示到畫面上
            CALL asrt310_sfdc_desc()
            NEXT FIELD sfdc012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc013
            #add-point:ON ACTION controlp INFIELD sfdc013 name="input.c.page1.sfdc013"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            #給予arg
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            #給予arg
            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc012             #給予default值
            LET g_qryparam.default2 = g_sfdc_d[l_ac].sfdc013
            LET g_qryparam.default3 = g_sfdc_d[l_ac].sfdc014
            LET g_qryparam.default4 = g_sfdc_d[l_ac].sfdc016
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d[l_ac].sfdc004,"'"
            #160304-00022#1---add---begin
            IF g_sfdc_d[l_ac].sfdc005 IS NOT NULL THEN 
               LET g_qryparam.where = g_qryparam.where," AND inag002 = '",g_sfdc_d[l_ac].sfdc005,"'"
            END IF
            #160304-00022#1---add---end            
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d[l_ac].sfdc013 = g_qryparam.return2
            LET g_sfdc_d[l_ac].sfdc014 = g_qryparam.return3
            LET g_sfdc_d[l_ac].sfdc016 = g_qryparam.return4

            DISPLAY g_sfdc_d[l_ac].sfdc013 TO sfdc013              #顯示到畫面上
            CALL asrt310_sfdc_desc()
            NEXT FIELD sfdc013                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc014
            #add-point:ON ACTION controlp INFIELD sfdc014 name="input.c.page1.sfdc014"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            #給予arg
            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc012             #給予default值
            LET g_qryparam.default2 = g_sfdc_d[l_ac].sfdc013
            LET g_qryparam.default3 = g_sfdc_d[l_ac].sfdc014
            LET g_qryparam.default4 = g_sfdc_d[l_ac].sfdc016
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d[l_ac].sfdc004,"'"
            #160304-00022#1---add---begin
            IF g_sfdc_d[l_ac].sfdc005 IS NOT NULL THEN 
               LET g_qryparam.where = g_qryparam.where," AND inag002 = '",g_sfdc_d[l_ac].sfdc005,"'"
            END IF
            #160304-00022#1---add---end            
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d[l_ac].sfdc013 = g_qryparam.return2
            LET g_sfdc_d[l_ac].sfdc014 = g_qryparam.return3
            LET g_sfdc_d[l_ac].sfdc016 = g_qryparam.return4

            DISPLAY g_sfdc_d[l_ac].sfdc014 TO sfdc014              #顯示到畫面上
            NEXT FIELD sfdc014                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc016
            #add-point:ON ACTION controlp INFIELD sfdc016 name="input.c.page1.sfdc016"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc012             #給予default值
            LET g_qryparam.default2 = g_sfdc_d[l_ac].sfdc013
            LET g_qryparam.default3 = g_sfdc_d[l_ac].sfdc014
            LET g_qryparam.default4 = g_sfdc_d[l_ac].sfdc016
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d[l_ac].sfdc004,"'"
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d[l_ac].sfdc013 = g_qryparam.return2
            LET g_sfdc_d[l_ac].sfdc014 = g_qryparam.return3
            LET g_sfdc_d[l_ac].sfdc016 = g_qryparam.return4

            DISPLAY g_sfdc_d[l_ac].sfdc016 TO sfdc016              #顯示到畫面上
            NEXT FIELD sfdc016                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfdc015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfdc015
            #add-point:ON ACTION controlp INFIELD sfdc015 name="input.c.page1.sfdc015"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfdc_d[l_ac].sfdc015             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_acc #
        
            CALL q_oocq002()                                #呼叫開窗

            LET g_sfdc_d[l_ac].sfdc015 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfdc_d[l_ac].sfdc015 TO sfdc015              #顯示到畫面上
            CALL asrt310_sfdc_desc()
            NEXT FIELD sfdc015                          #返回原欄位


            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt310_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sfdc_d[l_ac].sfdcseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asrt310_sfdc_t_mask_restore('restore_mask_o')
      
               UPDATE sfdc_t SET (sfdcdocno,sfdcsite,sfdcseq,sfdc004,sfdc005,sfdc006,sfdc007,sfdc008, 
                   sfdc009,sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc016,sfdc015) = (g_sfda_m.sfdadocno, 
                   g_sfdc_d[l_ac].sfdcsite,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005, 
                   g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007,g_sfdc_d[l_ac].sfdc008,g_sfdc_d[l_ac].sfdc009, 
                   g_sfdc_d[l_ac].sfdc010,g_sfdc_d[l_ac].sfdc011,g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013, 
                   g_sfdc_d[l_ac].sfdc014,g_sfdc_d[l_ac].sfdc016,g_sfdc_d[l_ac].sfdc015)
                WHERE sfdcent = g_enterprise AND sfdcdocno = g_sfda_m.sfdadocno 
 
                  AND sfdcseq = g_sfdc_d_t.sfdcseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfdc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfdc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfda_m.sfdadocno
               LET gs_keys_bak[1] = g_sfdadocno_t
               LET gs_keys[2] = g_sfdc_d[g_detail_idx].sfdcseq
               LET gs_keys_bak[2] = g_sfdc_d_t.sfdcseq
               CALL asrt310_update_b('sfdc_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asrt310_sfdc_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sfdc_d[g_detail_idx].sfdcseq = g_sfdc_d_t.sfdcseq 
 
                  ) THEN
                  LET gs_keys[01] = g_sfda_m.sfdadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sfdc_d_t.sfdcseq
 
                  CALL asrt310_key_update_b(gs_keys,'sfdc_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfda_m),util.JSON.stringify(g_sfdc_d_t)
               LET g_log2 = util.JSON.stringify(g_sfda_m),util.JSON.stringify(g_sfdc_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
                
               UPDATE sfdd_t SET sfdd003 = g_sfdc_d[l_ac].sfdc012,
                                 sfdd004 = g_sfdc_d[l_ac].sfdc013,
                                 sfdd005 = g_sfdc_d[l_ac].sfdc014,
                                 sfdd010 = g_sfdc_d[l_ac].sfdc016,
                                 sfdd013 = g_sfdc_d[l_ac].sfdc005    #161006-00018#13
                WHERE sfddent = g_enterprise
                  AND sfdddocno = g_sfda_m.sfdadocno 
                  AND sfddseq = g_sfdc_d[l_ac].sfdcseq
               IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = "sfdd_t"
                   LET g_errparam.popup = TRUE
                   CALL cl_err()

                   LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*                     
                   CALL s_transaction_end('N','0')
               END IF   
               LET l_time = cl_get_current()
               UPDATE sfda_t SET sfdamodid = g_user,
                                 sfdamoddt = l_time
                WHERE sfdaent = g_enterprise 
                  AND sfdadocno = g_sfda_m.sfdadocno 
               IF SQLCA.sqlcode THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = SQLCA.sqlcode
                   LET g_errparam.extend = "sfda_t"
                   LET g_errparam.popup = TRUE
                   CALL cl_err()

                   LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*                     
                   CALL s_transaction_end('N','0')
               END IF
#               CALL asrt310_b_fill_1()
#               DISPLAY ARRAY g_sfdc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b1)   
#    
#                  BEFORE DISPLAY
#                    EXIT DISPLAY
#               END DISPLAY
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
#            CALL asrt310_b_fill_1()
#            DISPLAY ARRAY g_sfdc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b1)   
#    
#                  BEFORE DISPLAY
#                    EXIT DISPLAY
#           END DISPLAY
            #end add-point
            CALL asrt310_unlock_b("sfdc_t","'1'")
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
               LET g_sfdc_d[li_reproduce_target].* = g_sfdc_d[li_reproduce].*
 
               LET g_sfdc_d[li_reproduce_target].sfdcseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfdc_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfdc_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="asrt310.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      DISPLAY ARRAY g_sfdc_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
         BEFORE ROW
            CALL asrt310_idx_chk()
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            LET g_detail_idx = l_ac
            CALL asrt310_b_fill_2()

         BEFORE DISPLAY
            CALL FGL_SET_ARR_CURR(g_detail_idx)
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            CALL asrt310_idx_chk()
            LET g_current_page = 2
            CALL asrt310_b_fill_1()
            
         #151009    
         ON ACTION s_lot_sel1
               LET g_action_choice="s_lot_sel1"
               IF cl_auth_chk_act("s_lot_sel1") THEN
                  IF cl_null(g_detail_idx) OR g_detail_idx = 0 THEN
                     #单身缺少资料，不可维护！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'abm-00073'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     EXIT DIALOG
                  END IF
                  
                  IF g_sfda_m.sfdastus <> 'N' THEN
                     #此笔单据状态不是未审核,不可修改！
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'apm-00035'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     EXIT DIALOG
                  END IF
                                   
                  IF cl_null(g_sfdc_d[g_detail_idx].sfdc012) THEN
                     #请先指定库位信息以便挑选批序号资料
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00691'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     EXIT DIALOG
                  END IF
                  
                  IF NOT cl_null(g_sfda_m.sfdadocno) AND
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdcseq) AND
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc004) AND #料件
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc006) AND #单位
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc007) AND #数量
                     NOT cl_null(g_sfda_m.sfda004) AND               #申请人
                     NOT cl_null(g_sfdc_d[g_detail_idx].sfdc012) THEN  
                     LET l_success = ''
                     CALL s_transaction_begin()
                     
                     #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                        CALL s_lot_sel('1','1',g_site,
                                       g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq,'1', #目的单号，项次，项序
                                       g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005,
                                       g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014,
                                       g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,'-1',g_prog,'',
                                       '','','','0' #来源单号，项次，项序,启用
                                       )
                             RETURNING l_success
                     ELSE #退料
                        #从当前单据中已产生的inao中选取退料资料
                        #              inao中抓 申请的资料 据点
                        CALL s_lot_sel('2','1',g_site,
                        #              目的单号            项次                           项序
                                       g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq,'1',
                        #              料件编号                        产品特征                        库存管理特征仓储批
                                       g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005,g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014,
                        #              退料单位                        数量
                                       g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,
                        #              出入库码 作业编号 据点
                                       '1',g_prog,'',
                        #              来源单号            项次                           项序 启用来源单据
                                       '','','','1'
                                       )
                             RETURNING l_success 
                     END IF
                     #150826-00008#3
                     IF l_success THEN 
                        IF asrt310_ins_inao_2() THEN 
                        END IF
                     END IF
                     #150826-00008#3
                     CALL asrt310_b_fill_3()                          
                     IF l_success THEN
                        CALL s_transaction_end('Y','0')
                     ELSE
                        CALL s_transaction_end('N','0')
                     END IF
                  END IF
               END IF
            #add 151009         
         
      END DISPLAY
         
      INPUT ARRAY g_sfdc_d3 FROM s_detail3.*
          ATTRIBUTE(COUNT = g_rec_b1,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 

         #151009
         ON ACTION s_lot_sel
            LET g_action_choice="s_lot_sel"
            IF cl_auth_chk_act("s_lot_sel") THEN
#               IF g_sfda_m.sfdastus <> 'N' THEN
#                  #此笔单据状态不是未审核,不可修改！
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'apm-00035'
#                  LET g_errparam.extend = ""
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  EXIT DIALOG
#               END IF
               
               IF cl_null(l_ac1) OR l_ac1 = 0 THEN
                  #未選擇資料,不可執行此操作;请选择一笔明细资料再执行此操作！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asf-00390'  #'abm-00073'单身缺少资料，不可维护！
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
            
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfddseq1) THEN
                  #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                  IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                     CALL s_lot_sel('1','2',
                                     #營運據點 目的單據編號
                                     g_site,g_sfda_m.sfdadocno,
                                     #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                     g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                     #料件編號                        產品特徵
                                     g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                     #庫存管理特徵                    庫位
                                     g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                     #儲位                           批號
                                     g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                     #交易單位                       交易數量
                                     g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,'-1',g_prog,'',
                                    '','','','0' #来源单号，项次，项序,启用
                                    )
                          RETURNING l_success
                  ELSE #退料
                     #从当前单据中已产生的inao中选取退料资料
                     #              inao中抓 申请的资料 据点
                     CALL s_lot_sel('2','2',#營運據點 目的單據編號
                                    g_site,g_sfda_m.sfdadocno,
                                    #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                    g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                    #料件編號                        產品特徵
                                    g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                    #庫存管理特徵                    庫位
                                    g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                    #儲位                           批號
                                    g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                    #交易單位                       交易數量
                                    g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
                                    #出入库码 作业编号 据点
                                    '1',g_prog,'',
                                    #来源单号            项次                           项序 启用来源单据
                                    '','','','1'
                                    )
                          RETURNING l_success 
                     CALL s_asrt310_update_inao('2','1',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1) RETURNING l_success 
                  END IF
                  CALL asrt310_b_fill_3()  
               END IF
            END IF            
         #151009

         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfdc_d3.getLength()+1) 
              LET g_insert = 'N' 
            END IF 
            CALL asrt310_b_fill_2()
            LET g_rec_b1 = g_sfdc_d3.getLength()
            IF g_mdemand = 'Y' THEN
               NEXT FIELD sfddseq1
            ELSE
               NEXT FIELD sfdcseq               
            END IF
            CALL s_aooi200_get_slip(g_sfda_m.sfdadocno) RETURNING l_flag,l_ooac002  ##161006-00018#13 add
            CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-BAS-0070') RETURNING l_ooac004  ##161006-00018#13 add
            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac1 = ARR_CURR()
            LET g_detail_idx = l_ac1
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac1 TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN asrt310_cl USING g_enterprise,g_sfda_m.sfdadocno

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN asrt310_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE asrt310_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
                              
            LET g_rec_b1 = g_sfdc_d3.getLength()
            
            IF g_rec_b1 >= l_ac1 AND g_sfdc_d3[l_ac1].sfddseq1 IS NOT NULL THEN
               LET l_cmd='u'
               LET g_sfdc_d3_t.* = g_sfdc_d3[l_ac1].*  #BACKUP
               LET g_sfdc_d3_o.* = g_sfdc_d3[l_ac1].*       #151009
               CALL asrt310_set_entry_b(l_cmd)
               CALL asrt310_set_no_entry_b(l_cmd)
               OPEN asrt310_bcl2 USING g_enterprise,g_site,g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "asrt310_bcl2"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET l_lock_sw='Y'
               ELSE
                  #FETCH asrt310_bcl2 INTO g_sfdc_d3[l_ac1].sfddseq1,g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd001_desc,g_sfdc_d3[l_ac1].sfdd001_desc1,g_sfdc_d3[l_ac1].sfdd002,g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd003_desc,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd004_desc,g_sfdc_d3[l_ac1].sfdd005,g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfdc_d3[l_ac1].sfdd008,g_sfdc_d3[l_ac1].sfdd009,g_sfdc_d3[l_ac1].sfdd011   #161006-00018#13 mark
                  FETCH asrt310_bcl2 INTO g_sfdc_d3[l_ac1].sfddseq1,g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd002,g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfdc_d3[l_ac1].sfdd008,g_sfdc_d3[l_ac1].sfdd009,g_sfdc_d3[l_ac1].sfdd011   #161006-00018#13 add
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_sfdc_d3_t.sfddseq1
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  LET g_bfill = "N"
                  CALL asrt310_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfdc_d3[l_ac1].* TO NULL 
            LET g_sfdc_d3[l_ac1].sfdd001 = g_sfdc_d2[l_ac].sfdc004_2
            LET g_sfdc_d3[l_ac1].sfdd002 = 1
            LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d2[l_ac].sfdc012_2
            LET g_sfdc_d3[l_ac1].sfdd004 = g_sfdc_d2[l_ac].sfdc013_2
            LET g_sfdc_d3[l_ac1].sfdd005 = g_sfdc_d2[l_ac].sfdc014_2
            LET g_sfdc_d3[l_ac1].sfdd006 = g_sfdc_d2[l_ac].sfdc006_2
            LET g_sfdc_d3[l_ac1].sfdd010 = g_sfdc_d2[l_ac].sfdc016_2
            LET g_sfdc_d3_t.* = g_sfdc_d3[l_ac1].*     #新輸入資料
            LET g_sfdc_d3_o.* = g_sfdc_d3[l_ac1].*       #151009
            CALL cl_show_fld_cont()
            CALL asrt310_set_entry_b(l_cmd)
            CALL asrt310_set_no_entry_b(l_cmd)
            SELECT MAX(sfddseq1) +1 INTO g_sfdc_d3[l_ac1].sfddseq1
              FROM sfdd_t
             WHERE sfddent = g_enterprise
               AND sfdddocno = g_sfda_m.sfdadocno
               AND sfddseq = g_sfdc_d[l_ac].sfdcseq
            IF cl_null(g_sfdc_d3[l_ac1].sfddseq1) THEN
               LET g_sfdc_d3[l_ac1].sfddseq1 = 1
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
               
            
            LET l_count = 1  
            SELECT COUNT(*) INTO l_count 
              FROM sfdd_t 
             WHERE sfddent = g_enterprise 
               AND sfdddocno = g_sfda_m.sfdadocno
               AND sfddseq = g_sfdc_d[l_ac].sfdcseq
               AND sfddseq1 = g_sfdc_d3[l_ac1].sfddseq1

                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
#               IF g_prog = 'asrt310' THEN
#                  LET l_sfdd012 = -1
#               ELSE
#                  LET l_sfdd012 = 1
#               END IF
               IF cl_null(g_sfdc_d3[l_ac1].sfdd003) THEN
                  LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d2[l_ac].sfdc012_2
               END IF
               INSERT INTO sfdd_t(sfddent,sfddsite,sfdddocno,sfddseq,sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005,sfdd006,sfdd007,sfdd008,sfdd009,sfdd010,sfdd011,sfdd012)
                           VALUES(g_enterprise,g_site,g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd002,g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfdc_d3[l_ac1].sfdd008,g_sfdc_d3[l_ac1].sfdd009,g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd011,l_sfdd012)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "sfdd_t"
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

               END IF  
               #161006-00018#13---add---s 
               IF g_prog = 'asrt310' AND l_ooac004 = 'Y' THEN               
                  #按实际的再次更新                          
                  CALL s_inventory_ins_inap('1',g_site,g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                            g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,g_sfdc_d3[l_ac1].sfdd010,
                                            g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                            g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfda_m.sfdadocdt,
                                            g_sfda_m.sfda004,g_sfda_m.sfda003,g_site) RETURNING l_success
               END IF
               #161006-00018#13---add---e                  
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_sfdc_d3[l_ac1].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfdd_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b1 = g_rec_b1 + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               CALL FGL_SET_ARR_CURR(l_ac1-1)
               CALL g_sfdc_d3.deleteElement(l_ac1)
               NEXT FIELD sfddseq1
            END IF
         
            IF g_sfdc_d3[l_ac1].sfddseq1 IS NOT NULL THEN 
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
               DELETE FROM sfdd_t
                WHERE sfddent = g_enterprise
                  AND sfdddocno = g_sfda_m.sfdadocno
                  AND sfddseq = g_sfdc_d[l_ac].sfdcseq
                  AND sfddseq1 = g_sfdc_d3[l_ac1].sfddseq1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "sfdd_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  #add 151009 -xianghui 
                  CALL s_asrt310_update_inao('2','2',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1) RETURNING l_success 
                  DELETE FROM inao_t WHERE inaoent = g_enterprise
                                       AND inaodocno = ps_keys_bak[1]
                                       AND inaoseq = g_sfdc_d[l_ac].sfdcseq 
                                       AND inaoseq1 = g_sfdc_d3[l_ac1].sfddseq1                                       
                  #add 151009                
                  LET g_rec_b1 = g_rec_b1-1
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE asrt310_bcl2
               LET l_count = g_sfdc_d3.getLength()
            END IF 

         AFTER DELETE 
            DELETE FROM sfdd_t
             WHERE sfddent = g_enterprise
               AND sfdddocno = g_sfda_m.sfdadocno
               AND sfddseq = g_sfdc_d[l_ac].sfdcseq
               AND sfddseq1 = g_sfdc_d3[l_ac1].sfddseq1
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfdd_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            CALL s_asrt310_update_inao('2','2',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1) RETURNING l_success             
            
         AFTER FIELD sfddseq1
            IF NOT cl_ap_chk_Range(g_sfdc_d3[l_ac1].sfddseq1,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sfddseq1
            END IF
            IF NOT cl_null(g_sfda_m.sfdadocno) AND NOT cl_null(g_sfdc_d[l_ac].sfdcseq) AND NOT cl_null(g_sfdc_d3[l_ac1].sfddseq1) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_sfdc_d3[l_ac1].sfddseq1 != g_sfdc_d3_t.sfddseq1) THEN 
                  IF NOT ap_chk_notDup(g_sfdc_d3[l_ac1].sfddseq1,"SELECT COUNT(*) FROM sfdd_t WHERE "||"sfddent = '" ||g_enterprise|| "'  AND "||"sfdddocno = '"||g_sfda_m.sfdadocno ||"' AND "|| "sfddseq = '"||g_sfdc_d[l_ac].sfdcseq||"' AND "|| "sfddseq1 = '"||g_sfdc_d3[l_ac1].sfddseq1 ||"'",'std-00004',0) THEN 
                     LET g_sfdc_d3[l_ac1].sfddseq1 = g_sfdc_d3_t.sfddseq1
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

         BEFORE FIELD sfddseq1

         ON CHANGE sfddseq1
          
         AFTER FIELD sfdd001
            CALL asrt310_sfdd_desc()
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd001) THEN
               CALL asrt310_chk_sfdd001()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sfdc_d3[l_ac1].sfdd001
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfdc_d3[l_ac1].sfdd001 = g_sfdc_d3_t.sfdd001
                  CALL asrt310_sfdd_desc()
                  NEXT FIELD CURRENT
               END IF
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd006) THEN
                  LET l_imaa006 = ""
                  SELECT imaa006 INTO l_imaa006
                    FROM imaa_t
                   WHERE imaaent = g_enterprise
                     AND imaa001 = g_sfdc_d3[l_ac1].sfdd001
                  CALL s_aimi190_get_convert(g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd006,l_imaa006) RETURNING l_success,l_rate
                  IF NOT l_success THEN
                     LET g_sfdc_d3[l_ac1].sfdd001 = g_sfdc_d3_t.sfdd001
                     CALL asrt310_sfdd_desc()
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd008) THEN
                  LET l_imaa006 = ""
                  SELECT imaa006 INTO l_imaa006
                    FROM imaa_t
                   WHERE imaaent = g_enterprise
                     AND imaa001 = g_sfdc_d3[l_ac1].sfdd001
                  CALL s_aimi190_get_convert(g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd008,l_imaa006) RETURNING l_success,l_rate
                  IF NOT l_success THEN
                     LET g_sfdc_d3[l_ac1].sfdd001 = g_sfdc_d3_t.sfdd001
                     CALL asrt310_sfdd_desc()
                     NEXT FIELD CURRENT
                  END IF
               END IF
              #IF s_lot_batch_number(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN     #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN #160314-00008#1 add
                  IF g_sfdc_d3_o.sfdd001 <> g_sfdc_d3[l_ac1].sfdd001 OR cl_null(g_sfdc_d3_o.sfdd001) THEN
                     CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'2',g_site) RETURNING l_success,l_cnt
                     IF l_cnt > 0 AND l_success = FALSE THEN
                        LET g_sfdc_d3[l_ac1].sfdd001 = g_sfdc_d3_t.sfdd001
                        CALL asrt310_sfdd_desc()
                        NEXT FIELD CURRENT
                     ELSE
                        DELETE FROM inao_t
                         WHERE inaoent = g_enterprise
                           AND inaosite = g_site
                           AND inaodocno = g_sfda_m.sfdadocno
                           AND inaoseq = g_sfdc_d[l_ac].sfdcseq
                           AND inao000 = '2'                       
                        #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                        IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                           CALL s_lot_sel('1','2',
                                           #營運據點 目的單據編號
                                           g_site,g_sfda_m.sfdadocno,
                                           #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                           g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                           #料件編號                        產品特徵
                                           g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                           #庫存管理特徵                    庫位
                                           g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                           #儲位                           批號
                                           g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                           #交易單位                       交易數量
                                           g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
                                           '-1',g_prog,'',
                                           '','','','0' #来源单号，项次，项序,启用
                                          )
                                RETURNING l_success
                        ELSE #退料
                           #从当前单据中已产生的inao中选取退料资料
                           #              inao中抓 申请的资料 据点
                           CALL s_lot_sel('2','2',#營運據點 目的單據編號
                                          g_site,g_sfda_m.sfdadocno,
                                          #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                          g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                          #料件編號                        產品特徵
                                          g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                          #庫存管理特徵                    庫位
                                          g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                          #儲位                           批號
                                          g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                          #交易單位                       交易數量
                                          g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
                                          #出入库码 作业编号 据点
                                          '1',g_prog,'',
                                          #来源单号            项次                           项序 启用来源单据
                                          '','','','1'
                                          )
                                RETURNING l_success
                           CALL s_asrt310_update_inao('2','1',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1) RETURNING l_success                                 
                        END IF
                     END IF
                  END IF
               END IF          
               #151009               
               CALL asrt310_set_entry_b(l_cmd)
               CALL asrt310_set_no_entry_b(l_cmd)
            END IF
            
         BEFORE FIELD sfdd001
           
         ON CHANGE sfdd001
         
         AFTER FIELD sfdd002
          
         BEFORE FIELD sfdd002
           
         ON CHANGE sfdd002
         
         #151009
         AFTER FIELD sfdd013
            IF NOT cl_null(g_sfdc_d3[l_ac].sfdd013) THEN
               CALL s_feature_check(g_sfdc_d3[l_ac].sfdd001,g_sfdc_d3[l_ac].sfdd013) RETURNING l_success
               IF NOT l_success THEN
                  LET g_sfdc_d3[l_ac].sfdd013 = g_sfdc_d3_t.sfdd013
                  NEXT FIELD sfdc005
               END IF
               #--151224-00025#4 add start--
               IF NOT s_feature_direct_input(g_sfdc_d3[l_ac].sfdd001,g_sfdc_d3[l_ac].sfdd013,g_sfdc_d3_t.sfdd013,g_sfda_m.sfdadocno,g_sfda_m.sfdasite) THEN
                  NEXT FIELD CURRENT
               END IF
               #--151224-00025#4 add end--
            END IF   
         ON ACTION controlp INFIELD sfdd013 
            CALL s_feature_single(g_sfdc_d3[l_ac].sfdd001,g_sfdc_d3[l_ac].sfdd013,'ALL','') RETURNING l_success,g_sfdc_d3[l_ac].sfdd013
            DISPLAY BY NAME g_sfdc_d3[l_ac].sfdd013              #顯示到畫面上
         #151009
 
         AFTER FIELD sfdd003
            CALL asrt310_sfdd_desc()
            #161006-00018#13---mark---s
            #IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd004) THEN
            #   #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
            #   INITIALIZE g_chkparam.* TO NULL
            #
            #   #設定g_chkparam.*的參數
            #   LET g_chkparam.arg1 = g_site
            #   LET g_chkparam.arg2 = g_sfdc_d3[l_ac1].sfdd003
            #   LET g_chkparam.arg3 = g_sfdc_d3[l_ac1].sfdd004
            #   #160318-00025#22  by 07900 --add-str
            #  LET g_errshow = TRUE #是否開窗                   
            #  LET g_chkparam.err_str[1] ="aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002"
            #  #160318-00025#22  by 07900 --add-end
            #   #呼叫檢查存在並帶值的library
            #   IF NOT cl_chk_exist("v_inab002") THEN
            #      LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d3_t.sfdd003
            #      CALL asrt310_sfdd_desc()
            #      NEXT FIELD CURRENT
            #   END IF
            #END IF
            #161006-00018#13---mark---e
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd003) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfdc_d3[l_ac1].sfdd003
               #160318-00025#22  by 07900 --add-str
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
              #160318-00025#22  by 07900 --add-end 
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_inaa001_2") THEN
                  LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d3_t.sfdd003
                  CALL asrt310_sfdd_desc()
                  NEXT FIELD CURRENT
               END IF
               #161006-00018#13---add---s
               IF g_sfdc_d3_o.sfdd003 <> g_sfdc_d3[l_ac1].sfdd003 THEN
                  LET g_sfdc_d3[l_ac1].sfdd004 = ''
                  LET g_sfdc_d3[l_ac1].sfdd004_desc = ''
               END IF
               #161006-00018#13---add---e
            END IF          
            #151009
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd003) THEN
              #IF s_lot_batch_number(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN  #160314-00008#1 add
                  IF g_sfdc_d3_o.sfdd003 <> g_sfdc_d3[l_ac1].sfdd003 OR cl_null(g_sfdc_d3_o.sfdd003) OR
                     g_sfdc_d3_o.sfdd004 <> g_sfdc_d3[l_ac1].sfdd004 OR g_sfdc_d3_o.sfdd004 IS NULL OR
                     g_sfdc_d3_o.sfdd005 <> g_sfdc_d3[l_ac1].sfdd005 OR g_sfdc_d3_o.sfdd005 IS NULL THEN
                     #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                     IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                        CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'2',g_site) RETURNING l_success,l_cnt
                        IF l_cnt > 0 AND l_success = FALSE THEN
                           LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d3_t.sfdd003
                           LET g_sfdc_d3[l_ac1].sfdd004 = g_sfdc_d3_t.sfdd004
                           LET g_sfdc_d3[l_ac1].sfdd005 = g_sfdc_d3_t.sfdd005
                           CALL asrt310_sfdd_desc()
                           NEXT FIELD CURRENT
                        ELSE
                           DELETE FROM inao_t
                            WHERE inaoent = g_enterprise
                              AND inaosite = g_site
                              AND inaodocno = g_sfda_m.sfdadocno
                              AND inaoseq = g_sfdc_d[l_ac].sfdcseq
                              AND inao000 = '2'                       
         
                           CALL s_lot_sel('1','2',
                                           #營運據點 目的單據編號
                                           g_site,g_sfda_m.sfdadocno,
                                           #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                           g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                           #料件編號                        產品特徵
                                           g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                           #庫存管理特徵                    庫位
                                           g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                           #儲位                           批號
                                           g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                           #交易單位                       交易數量
                                           g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,'-1',g_prog,'',
                                          '','','','0' #来源单号，项次，项序,启用
                                          )
                                RETURNING l_success
                                
                        END IF
                     ELSE #退料
#                        #从当前单据中已产生的inao中选取退料资料
#                        #              inao中抓 申请的资料 据点
#                        CALL s_lot_sel('2','2',#營運據點 目的單據編號
#                                       g_site,g_sfda_m.sfdadocno,
#                                       #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
#                                       g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
#                                       #料件編號                        產品特徵
#                                       g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
#                                       #庫存管理特徵                    庫位
#                                       g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
#                                       #儲位                           批號
#                                       g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
#                                       #交易單位                       交易數量
#                                       g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
#                                       #出入库码 作业编号 据点
#                                       '1',g_prog,'',
#                                       #来源单号            项次                           项序 启用来源单据
#                                       '','','','1'
#                                       )
#                             RETURNING l_success
                        CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,'2',g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_site,g_sfdc_d3[l_ac1].sfdd010)  #160316-00007#7 add sfdc016 
                            RETURNING l_success                         
                     END IF
                  END IF
               END IF
            END IF
            LET g_sfdc_d3_o.sfdd003 = g_sfdc_d3[l_ac1].sfdd003
            LET g_sfdc_d3_o.sfdd004 = g_sfdc_d3[l_ac1].sfdd004
            LET g_sfdc_d3_o.sfdd005 = g_sfdc_d3[l_ac1].sfdd005
            #151009             
            
         BEFORE FIELD sfdd003
           
         ON CHANGE sfdd003
         
         AFTER FIELD sfdd004
            CALL asrt310_sfdd_desc()
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd004) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
    
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_site
               LET g_chkparam.arg2 = g_sfdc_d3[l_ac1].sfdd003
               LET g_chkparam.arg3 = g_sfdc_d3[l_ac1].sfdd004
               #160318-00025#22  by 07900 --add-str
              LET g_errshow = TRUE #是否開窗                   
              LET g_chkparam.err_str[1] ="aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002"
              #160318-00025#22  by 07900 --add-end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_inab002") THEN
                  LET g_sfdc_d3[l_ac1].sfdd004 = g_sfdc_d3_t.sfdd004
                  CALL asrt310_sfdd_desc()
                  NEXT FIELD CURRENT
               END IF
            END IF
           #151009
           IF cl_null(g_sfdc_d3[l_ac1].sfdd004) THEN
              LET g_sfdc_d3[l_ac1].sfdd004 = ' '
           END IF
          
           IF g_sfdc_d3[l_ac1].sfdd004 IS NOT NULL THEN
             #IF s_lot_batch_number(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN      #160314-00008#1 mark
              IF s_lot_batch_number_1n3(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN  #160314-00008#1 add  
                  IF g_sfdc_d3_o.sfdd003 <> g_sfdc_d3[l_ac1].sfdd003 OR cl_null(g_sfdc_d3_o.sfdd003) OR
                     g_sfdc_d3_o.sfdd004 <> g_sfdc_d3[l_ac1].sfdd004 OR g_sfdc_d3_o.sfdd004 IS NULL OR
                     g_sfdc_d3_o.sfdd005 <> g_sfdc_d3[l_ac1].sfdd005 OR g_sfdc_d3_o.sfdd005 IS NULL THEN
                    #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                    IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                       CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'2',g_site) RETURNING l_success,l_cnt
                       IF l_cnt > 0 AND l_success = FALSE THEN
                          LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d3_t.sfdd003
                          LET g_sfdc_d3[l_ac1].sfdd004 = g_sfdc_d3_t.sfdd004
                          LET g_sfdc_d3[l_ac1].sfdd005 = g_sfdc_d3_t.sfdd005
                          CALL asrt310_sfdd_desc()
                          NEXT FIELD CURRENT
                       ELSE
                          DELETE FROM inao_t
                           WHERE inaoent = g_enterprise
                             AND inaosite = g_site
                             AND inaodocno = g_sfda_m.sfdadocno
                             AND inaoseq = g_sfdc_d[l_ac].sfdcseq
                             AND inao000 = '2'
                          CALL s_lot_sel('1','2',
                                          #營運據點 目的單據編號
                                          g_site,g_sfda_m.sfdadocno,
                                          #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                          g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                          #料件編號                        產品特徵
                                          g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                          #庫存管理特徵                    庫位
                                          g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                          #儲位                           批號
                                          g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                          #交易單位                       交易數量
                                          g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,'-1',g_prog,'',
                                         '','','','0' #来源单号，项次，项序,启用
                                         )
                               RETURNING l_success
                       END IF
                    ELSE #退料
#                       #从当前单据中已产生的inao中选取退料资料
#                       #              inao中抓 申请的资料 据点
#                       CALL s_lot_sel('2','2',#營運據點 目的單據編號
#                                      g_site,g_sfda_m.sfdadocno,
#                                      #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
#                                      g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
#                                      #料件編號                        產品特徵
#                                      g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
#                                      #庫存管理特徵                    庫位
#                                      g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
#                                      #儲位                           批號
#                                      g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
#                                      #交易單位                       交易數量
#                                      g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
#                                      #出入库码 作业编号 据点
#                                      '1',g_prog,'',
#                                      #来源单号            项次                           项序 启用来源单据
#                                      '','','','1'
#                                      )
#                            RETURNING l_success 
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,'2',g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_site,g_sfdc_d3[l_ac1].sfdd010)   #160316-00007#7 add sfdc016 
                           RETURNING l_success                             
                    END IF
                 END IF
               END IF              
            END IF
            LET g_sfdc_d3_o.sfdd003 = g_sfdc_d3[l_ac1].sfdd003
            LET g_sfdc_d3_o.sfdd004 = g_sfdc_d3[l_ac1].sfdd004
            LET g_sfdc_d3_o.sfdd005 = g_sfdc_d3[l_ac1].sfdd005
            #151009            
            
         BEFORE FIELD sfdd004
           
         ON CHANGE sfdd004
         
         AFTER FIELD sfdd005
           #151009
           IF cl_null(g_sfdc_d3[l_ac1].sfdd005) THEN
              LET g_sfdc_d3[l_ac1].sfdd005 = ' '
           END IF
          
           IF g_sfdc_d3[l_ac1].sfdd005 IS NOT NULL THEN
             #IF s_lot_batch_number(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN      #160314-00008#1 mark
              IF s_lot_batch_number_1n3(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN  #160314-00008#1 add  
                 IF g_sfdc_d3_o.sfdd003 <> g_sfdc_d3[l_ac1].sfdd003 OR cl_null(g_sfdc_d3_o.sfdd003) OR
                    g_sfdc_d3_o.sfdd004 <> g_sfdc_d3[l_ac1].sfdd004 OR g_sfdc_d3_o.sfdd004 IS NULL OR
                    g_sfdc_d3_o.sfdd005 <> g_sfdc_d3[l_ac1].sfdd005 OR g_sfdc_d3_o.sfdd005 IS NULL THEN
                    #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                    IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                       CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'2',g_site) RETURNING l_success,l_cnt
                       IF l_cnt > 0 AND l_success = FALSE THEN
                          LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d3_t.sfdd003
                          LET g_sfdc_d3[l_ac1].sfdd004 = g_sfdc_d3_t.sfdd004
                          LET g_sfdc_d3[l_ac1].sfdd005 = g_sfdc_d3_t.sfdd005
                          CALL asrt310_sfdd_desc()
                          NEXT FIELD CURRENT
                       ELSE
                          DELETE FROM inao_t
                           WHERE inaoent = g_enterprise
                             AND inaosite = g_site
                             AND inaodocno = g_sfda_m.sfdadocno
                             AND inaoseq = g_sfdc_d[l_ac].sfdcseq
                             AND inao000 = '2'                       
                       
                          CALL s_lot_sel('1','2',
                                          #營運據點 目的單據編號
                                          g_site,g_sfda_m.sfdadocno,
                                          #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                          g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                          #料件編號                        產品特徵
                                          g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                          #庫存管理特徵                    庫位
                                          g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                          #儲位                           批號
                                          g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                          #交易單位                       交易數量
                                          g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,'-1',g_prog,'',
                                         '','','','0' #来源单号，项次，项序,启用
                                         )
                               RETURNING l_success
                               
                       END IF
                    ELSE #退料
#                       #从当前单据中已产生的inao中选取退料资料
#                       #              inao中抓 申请的资料 据点
#                       CALL s_lot_sel('2','2',#營運據點 目的單據編號
#                                      g_site,g_sfda_m.sfdadocno,
#                                      #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
#                                      g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
#                                      #料件編號                        產品特徵
#                                      g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
#                                      #庫存管理特徵                    庫位
#                                      g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
#                                      #儲位                           批號
#                                      g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
#                                      #交易單位                       交易數量
#                                      g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
#                                      #出入库码 作业编号 据点
#                                      '1',g_prog,'',
#                                      #来源单号            项次                           项序 启用来源单据
#                                      '','','','1'
#                                      )
#                            RETURNING l_success
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,'2',g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_site,g_sfdc_d3[l_ac1].sfdd010)  #160316-00007#7 add sfdc016 
                           RETURNING l_success                        
                    END IF
                 END IF
               END IF              
            END IF
            LET g_sfdc_d3_o.sfdd003 = g_sfdc_d3[l_ac1].sfdd003
            LET g_sfdc_d3_o.sfdd004 = g_sfdc_d3[l_ac1].sfdd004
            LET g_sfdc_d3_o.sfdd005 = g_sfdc_d3[l_ac1].sfdd005            
            #151009             
         BEFORE FIELD sfdd005
           
         ON CHANGE sfdd005
         
         AFTER FIELD sfdd006
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd006) THEN
               IF NOT ap_chk_isExist(g_sfdc_d3[l_ac1].sfdd006,"SELECT COUNT(*) FROM ooca_t WHERE oocaent = '" ||g_enterprise||"' AND ooca001 = ? ","aim-00004",1 ) THEN
                  LET g_sfdc_d3[l_ac1].sfdd006 = g_sfdc_d3_t.sfdd006
                  NEXT FIELD sfdd006
               END IF
#               IF NOT ap_chk_isExist(g_sfdc_d3[l_ac1].sfdd006,"SELECT COUNT(*) FROM ooca_t WHERE oocaent = '" ||g_enterprise||"' AND ooca001 = ? AND oocastus = 'Y' ","aim-00005",1 ) THEN  #160318-00005#44 mark
               IF NOT ap_chk_isExist(g_sfdc_d3[l_ac1].sfdd006,"SELECT COUNT(*) FROM ooca_t WHERE oocaent = '" ||g_enterprise||"' AND ooca001 = ? AND oocastus = 'Y' ","sub-01302",'aooi250' ) THEN   #160318-00005#44 add
                  LET g_sfdc_d3[l_ac1].sfdd006 = g_sfdc_d3_t.sfdd006
                  NEXT FIELD sfdd006
               END IF
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd001) THEN
                  LET l_imaa006 = ""
                  SELECT imaa006 INTO l_imaa006
                    FROM imaa_t
                   WHERE imaaent = g_enterprise
                     AND imaa001 = g_sfdc_d3[l_ac1].sfdd001
                  CALL s_aimi190_get_convert(g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd006,l_imaa006) RETURNING l_success,l_rate
                  IF NOT l_success THEN
                     LET g_sfdc_d3[l_ac1].sfdd006 = g_sfdc_d3_t.sfdd006
                     NEXT FIELD sfdd006
                  END IF
               END IF
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd007) THEN
                  LET g_sfdc_d3[l_ac1].sfdd009 = g_sfdc_d3[l_ac1].sfdd007 * l_rate
                  DISPLAY BY NAME g_sfdc_d3[l_ac1].sfdd009
               END IF
            END IF
            
         BEFORE FIELD sfdd006
           
         ON CHANGE sfdd006
         
         AFTER FIELD sfdd007
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd007) THEN
               IF NOT cl_ap_chk_Range(g_sfdc_d3[l_ac1].sfdd007,"0.000000","0","","","azz-00079",1) THEN
                  LET g_sfdc_d3[l_ac1].sfdd007 = g_sfdc_d3_t.sfdd007
                  NEXT FIELD sfdd007
               END IF
               LET l_sfdd007 = ''
               IF l_cmd = 'a' THEN
                  SELECT SUM(sfdd007) INTO l_sfdd007
                    FROM sfdd_t
                   WHERE sfddent = g_enterprise
                     AND sfdddocno = g_sfda_m.sfdadocno
                     AND sfddseq = g_sfdc_d2[l_ac].sfdcseq_2
               ELSE
                  SELECT SUM(sfdd007) INTO l_sfdd007
                    FROM sfdd_t
                   WHERE sfddent = g_enterprise
                     AND sfdddocno = g_sfda_m.sfdadocno
                     AND sfddseq = g_sfdc_d2[l_ac].sfdcseq_2 
                     AND sfddseq1 <> g_sfdc_d3[l_ac1].sfddseq1
               END IF
               IF cl_null(l_sfdd007) THEN LET l_sfdd007 = 0 END IF
               IF (l_sfdd007+g_sfdc_d3[l_ac1].sfdd007) > g_sfdc_d2[l_ac].sfdc007_2 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asr-00010'
                  LET g_errparam.extend = g_sfdc_d3[l_ac1].sfdd007
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfdc_d3[l_ac1].sfdd007 = g_sfdc_d3_t.sfdd007
                  NEXT FIELD sfdd007
               END IF
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd006) THEN
                  IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd001) THEN
                     LET l_imaa006 = ""
                     SELECT imaa006 INTO l_imaa006
                       FROM imaa_t
                      WHERE imaaent = g_enterprise
                        AND imaa001 = g_sfdc_d3[l_ac1].sfdd001
                     CALL s_aimi190_get_convert(g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd006,l_imaa006) RETURNING l_success,l_rate
                  END IF
                  LET g_sfdc_d3[l_ac1].sfdd009 = g_sfdc_d3[l_ac1].sfdd007 * l_rate
                  DISPLAY BY NAME g_sfdc_d3[l_ac1].sfdd009
               END IF
               LET g_sfdc_d[l_ac].sfdc008 = l_sfdd007+g_sfdc_d3[l_ac1].sfdd007
               LET g_sfdc_d2[l_ac].sfdc008_2 = l_sfdd007+g_sfdc_d3[l_ac1].sfdd007
               UPDATE sfdc_t
                  SET sfdc008 = l_sfdd007+g_sfdc_d3[l_ac1].sfdd007
                WHERE sfdcent = g_enterprise
                  AND sfdcdocno = g_sfda_m.sfdadocno
                  AND sfdcseq = g_sfdc_d[l_ac].sfdcseq
               #151009  
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt FROM inao_t WHERE inaoent = g_enterprise AND inaodocno = g_sfda_m.sfdadocno AND inao000='2' AND inaoseq = g_sfdc_d[l_ac].sfdcseq
               IF g_sfdc_d3_o.sfdd007 <> g_sfdc_d3[l_ac1].sfdd007 OR cl_null(g_sfdc_d3_o.sfdd007) OR l_cnt = 0 THEN
                  #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料         #160705-00042#10 160713 by sakura mark
                  IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料    #160705-00042#10 160713 by sakura add
                     CALL s_lot_sel('1','2',
                                     #營運據點 目的單據編號
                                     g_site,g_sfda_m.sfdadocno,
                                     #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                     g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                     #料件編號                        產品特徵
                                     g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                     #庫存管理特徵                    庫位
                                     g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                     #儲位                           批號
                                     g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                     #交易單位                       交易數量
                                     g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,'-1',g_prog,'',
                                    '','','','0' #来源单号，项次，项序,启用
                                    )
                          RETURNING l_success
                  ELSE #退料
                     #从当前单据中已产生的inao中选取退料资料
                     #              inao中抓 申请的资料 据点
                     CALL s_lot_sel('2','2',#營運據點 目的單據編號
                                    g_site,g_sfda_m.sfdadocno,
                                    #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                    g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                    #料件編號                        產品特徵
                                    g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                    #庫存管理特徵                    庫位
                                    g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                    #儲位                           批號
                                    g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                    #交易單位                       交易數量
                                    g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,
                                    #出入库码 作业编号 据点
                                    '1',g_prog,'',
                                    #来源单号            项次                           项序 启用来源单据
                                    '','','','1'
                                    )
                          RETURNING l_success 
                     CALL s_asrt310_update_inao('2','1',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1) RETURNING l_success      
                  END IF
                  CALL asrt310_b_fill_3() 
               END IF     
               #151009                 
            END IF
            LET g_sfdc_d3_o.sfdd007 = g_sfdc_d3[l_ac1].sfdd007
         BEFORE FIELD sfdd007
           
         ON CHANGE sfdd007
         
         AFTER FIELD sfdd008
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd008) THEN
               IF NOT ap_chk_isExist(g_sfdc_d3[l_ac1].sfdd008,"SELECT COUNT(*) FROM ooca_t WHERE oocaent = '" ||g_enterprise||"' AND ooca001 = ? ","aim-00004",1 ) THEN
                  LET g_sfdc_d3[l_ac1].sfdd008 = g_sfdc_d3_t.sfdd008
                  NEXT FIELD sfdd008
               END IF
#               IF NOT ap_chk_isExist(g_sfdc_d3[l_ac1].sfdd008,"SELECT COUNT(*) FROM ooca_t WHERE oocaent = '" ||g_enterprise||"' AND ooca001 = ? AND oocastus = 'Y' ","aim-00005",1 ) THEN  #160318-00005#44 mark
               IF NOT ap_chk_isExist(g_sfdc_d3[l_ac1].sfdd008,"SELECT COUNT(*) FROM ooca_t WHERE oocaent = '" ||g_enterprise||"' AND ooca001 = ? AND oocastus = 'Y' ","sub-01302",'aooi250' ) THEN   #160318-00005#44 add
                  LET g_sfdc_d3[l_ac1].sfdd008 = g_sfdc_d3_t.sfdd008
                  NEXT FIELD sfdd008
               END IF
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd001) THEN
                  LET l_imaa006 = ""
                  SELECT imaa006 INTO l_imaa006
                    FROM imaa_t
                   WHERE imaaent = g_enterprise
                     AND imaa001 = g_sfdc_d3[l_ac1].sfdd001
                  CALL s_aimi190_get_convert(g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd008,l_imaa006) RETURNING l_success,l_rate
                  IF NOT l_success THEN
                     LET g_sfdc_d3[l_ac1].sfdd008 = g_sfdc_d3_t.sfdd008
                     NEXT FIELD sfdd008
                  END IF
               END IF
            END IF
         BEFORE FIELD sfdd008
           
         ON CHANGE sfdd008
         
         AFTER FIELD sfdd009
            IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd009) THEN    
               IF NOT cl_ap_chk_Range(g_sfdc_d3[l_ac1].sfdd009,"0.000000","0","","","azz-00079",1) THEN
                  LET g_sfdc_d3[l_ac1].sfdd009 = g_sfdc_d3_t.sfdd009
                  NEXT FIELD sfdd009
               END IF
               LET l_sfdd009 = ''
               IF l_cmd = 'a' THEN
                  SELECT SUM(sfdd009) INTO l_sfdd009
                    FROM sfdd_t
                   WHERE sfddent = g_enterprise
                     AND sfdddocno = g_sfda_m.sfdadocno
                     AND sfddseq = g_sfdc_d2[l_ac].sfdcseq_2
               ELSE
                  SELECT SUM(sfdd009) INTO l_sfdd009
                    FROM sfdd_t
                   WHERE sfddent = g_enterprise
                     AND sfdddocno = g_sfda_m.sfdadocno
                     AND sfddseq = g_sfdc_d2[l_ac].sfdcseq_2 
                     AND sfddseq1 <> g_sfdc_d3[l_ac1].sfddseq1
               END IF
               IF cl_null(l_sfdd009) THEN LET l_sfdd009 = 0 END IF
               IF (l_sfdd009+g_sfdc_d3[l_ac1].sfdd009) > g_sfdc_d2[l_ac].sfdc010_2 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asr-00010'
                  LET g_errparam.extend = g_sfdc_d3[l_ac1].sfdd009
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sfdc_d3[l_ac1].sfdd009 = g_sfdc_d3_t.sfdd009
                  NEXT FIELD sfdd009
               END IF
               LET g_sfdc_d[l_ac].sfdc011 = l_sfdd009+g_sfdc_d3[l_ac1].sfdd009
               LET g_sfdc_d2[l_ac].sfdc011_2 = l_sfdd009+g_sfdc_d3[l_ac1].sfdd009
               UPDATE sfdc_t
                  SET sfdc011 = l_sfdd009+g_sfdc_d3[l_ac1].sfdd009
                WHERE sfdcent = g_enterprise
                  AND sfdcdocno = g_sfda_m.sfdadocno
                  AND sfdcseq = g_sfdc_d[l_ac].sfdcseq
            END IF
         BEFORE FIELD sfdd009
           
         ON CHANGE sfdd009
         
         AFTER FIELD sfdd010
           #160316-00007#7---add---begin
           IF cl_null(g_sfdc_d3[l_ac1].sfdd010) THEN
              LET g_sfdc_d3[l_ac1].sfdd010 = ' '
           END IF
           IF g_sfdc_d3[l_ac1].sfdd010 IS NOT NULL THEN
              IF s_lot_batch_number_1n3(g_sfdc_d3[l_ac1].sfdd001,g_site) THEN    
                 IF g_sfdc_d3_o.sfdd010 <> g_sfdc_d3[l_ac1].sfdd010 OR g_sfdc_d3_o.sfdd010 IS NULL THEN
                    #IF g_prog = 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料        #160705-00042#10 160713 by sakura mark
                    IF g_prog MATCHES 'asrt310' AND g_sfdc_d[g_detail_idx].sfdc007 > 0 THEN  #发料   #160705-00042#10 160713 by sakura add
                       CALL s_lot_inao_chk(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,1,'2',g_site) RETURNING l_success,l_cnt
                       IF l_cnt > 0 AND l_success = FALSE THEN
                          LET g_sfdc_d3[l_ac1].sfdd010 = g_sfdc_d3_t.sfdd010
                          CALL asrt310_sfdd_desc()
                          NEXT FIELD CURRENT
                       ELSE
                          DELETE FROM inao_t
                           WHERE inaoent = g_enterprise
                             AND inaosite = g_site
                             AND inaodocno = g_sfda_m.sfdadocno
                             AND inaoseq = g_sfdc_d[l_ac].sfdcseq
                             AND inao000 = '2'                       
                       
                          CALL s_lot_sel('1','2',
                                          #營運據點 目的單據編號
                                          g_site,g_sfda_m.sfdadocno,
                                          #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳1)
                                          g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                          #料件編號                        產品特徵
                                          g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,
                                          #庫存管理特徵                    庫位
                                          g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd003,
                                          #儲位                           批號
                                          g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                          #交易單位                       交易數量
                                          g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,'-1',g_prog,'',
                                         '','','','0' #来源单号，项次，项序,启用
                                         )
                               RETURNING l_success
                               
                       END IF
                    ELSE #退料
                       CALL s_lot_upd_inao(g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,'2',g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_site,g_sfdc_d3[l_ac1].sfdd010)
                           RETURNING l_success                        
                    END IF
                 END IF
               END IF
            END IF
            LET g_sfdc_d3_o.sfdd010 = g_sfdc_d3[l_ac1].sfdd010            
            #160316-00007#7---add---end          
         BEFORE FIELD sfdd010
           
         ON CHANGE sfdd010
         
         AFTER FIELD sfdd011
          
         BEFORE FIELD sfdd011
           
         ON CHANGE sfdd011
         
         ON ACTION controlp INFIELD sfdd001 
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		    LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd001             #給予default值
            #給予arg
            LET g_qryparam.where = " bmea001 = '",g_sfda_m.sfda006,"' AND bmea002 = '",g_sfda_m.sfda007,"' AND bmea003 = '",g_sfdc_d2[l_ac].sfdc004_2,"'"
            CALL q_bmea008_3()                                             #呼叫開窗
            LET g_sfdc_d3[l_ac1].sfdd001 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_sfdc_d3[l_ac1].sfdd001 TO sfdd001                    #顯示到畫面上
            LET g_qryparam.where = ""
            CALL asrt310_sfdd_desc()
            NEXT FIELD sfdd001                                             #返回原欄位
            
         ON ACTION controlp INFIELD sfdd003   
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd003            #給予default值
            LET g_qryparam.default2 = g_sfdc_d3[l_ac1].sfdd004
            LET g_qryparam.default3 = g_sfdc_d3[l_ac1].sfdd005
            LET g_qryparam.default4 = g_sfdc_d3[l_ac1].sfdd010
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d3[l_ac1].sfdd001 ,"'",
                                   " AND inag008 > 0 " #161006-00018#13 add
            #160304-00022#1---add---begin
            IF g_sfdc_d3[l_ac1].sfdd013 IS NOT NULL THEN 
               LET g_qryparam.where = g_qryparam.where," AND inag002 = '",g_sfdc_d3[l_ac1].sfdd013,"'"
            END IF
            #160304-00022#1---add---end            
            CALL q_inag005_9()                                #呼叫開窗
            
            LET g_sfdc_d3[l_ac1].sfdd003 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d3[l_ac1].sfdd004 = g_qryparam.return2
            LET g_sfdc_d3[l_ac1].sfdd005 = g_qryparam.return3
            LET g_sfdc_d3[l_ac1].sfdd010 = g_qryparam.return4
            DISPLAY g_sfdc_d3[l_ac1].sfdd003 TO sfdd003                 #161128-00047#1 add
            CALL asrt310_sfdd_desc()
            NEXT FIELD sfdd003                                             #返回原欄位
            
         ON ACTION controlp INFIELD sfdd004            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		   	LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd003            #給予default值
            LET g_qryparam.default2 = g_sfdc_d3[l_ac1].sfdd004
            LET g_qryparam.default3 = g_sfdc_d3[l_ac1].sfdd005
            LET g_qryparam.default4 = g_sfdc_d3[l_ac1].sfdd010
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d3[l_ac1].sfdd001 ,"'",
                                   " AND inag008 > 0 " #161006-00018#13 add
            #160304-00022#1---add---begin
            IF g_sfdc_d3[l_ac1].sfdd013 IS NOT NULL THEN 
               LET g_qryparam.where = g_qryparam.where," AND inag002 = '",g_sfdc_d3[l_ac1].sfdd013,"'"
            END IF
            #160304-00022#1---add---end             
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d3[l_ac1].sfdd003 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d3[l_ac1].sfdd004 = g_qryparam.return2
            LET g_sfdc_d3[l_ac1].sfdd005 = g_qryparam.return3
            LET g_sfdc_d3[l_ac1].sfdd010 = g_qryparam.return4
            DISPLAY g_sfdc_d3[l_ac1].sfdd004 TO sfdd004                    #顯示到畫面上  #161128-00047#1 add
            NEXT FIELD sfdd004                                             #返回原欄位

         ON ACTION controlp INFIELD sfdd005 
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			  LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd003            #給予default值
            LET g_qryparam.default2 = g_sfdc_d3[l_ac1].sfdd004
            LET g_qryparam.default3 = g_sfdc_d3[l_ac1].sfdd005
            LET g_qryparam.default4 = g_sfdc_d3[l_ac1].sfdd010
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d3[l_ac1].sfdd001 ,"'",
                                   " AND inag008 > 0 " #161006-00018#13 add
            #160304-00022#1---add---begin
            IF g_sfdc_d3[l_ac1].sfdd013 IS NOT NULL THEN 
               LET g_qryparam.where = g_qryparam.where," AND inag002 = '",g_sfdc_d3[l_ac1].sfdd013,"'"
            END IF
            #160304-00022#1---add---end             
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d3[l_ac1].sfdd003 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d3[l_ac1].sfdd004 = g_qryparam.return2
            LET g_sfdc_d3[l_ac1].sfdd005 = g_qryparam.return3
            LET g_sfdc_d3[l_ac1].sfdd010 = g_qryparam.return4
            DISPLAY g_sfdc_d3[l_ac1].sfdd005 TO sfdd005                    #顯示到畫面上
            NEXT FIELD sfdd005                                             #返回原欄位
            
        ON ACTION controlp INFIELD sfdd006
            #開窗i段
		    INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
	        LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd006             #給予default值
            #給予arg
            CALL q_ooca001_1()                                             #呼叫開窗
            LET g_sfdc_d3[l_ac1].sfdd006 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_sfdc_d3[l_ac1].sfdd006 TO sfdd006                    #顯示到畫面上
            NEXT FIELD sfdd006                                             #返回原欄位
 
         ON ACTION controlp INFIELD sfdd008
            #開窗i段
	        INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd008             #給予default值
            #給予arg
            CALL q_ooca001_1()                                             #呼叫開窗
            LET g_sfdc_d3[l_ac1].sfdd008 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_sfdc_d3[l_ac1].sfdd008 TO sfdd008                    #顯示到畫面上
            NEXT FIELD sfdd008                                             #返回原欄位
            
          ON ACTION controlp INFIELD sfdd010 
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			  LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_sfdc_d3[l_ac1].sfdd003            #給予default值
            LET g_qryparam.default2 = g_sfdc_d3[l_ac1].sfdd004
            LET g_qryparam.default3 = g_sfdc_d3[l_ac1].sfdd005
            LET g_qryparam.default4 = g_sfdc_d3[l_ac1].sfdd010
            #給予arg
            LET g_qryparam.where = " inag001 ='",g_sfdc_d3[l_ac1].sfdd001 ,"'"
            CALL q_inag005_9()                                #呼叫開窗

            LET g_sfdc_d3[l_ac1].sfdd003 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfdc_d3[l_ac1].sfdd004 = g_qryparam.return2
            LET g_sfdc_d3[l_ac1].sfdd005 = g_qryparam.return3
            LET g_sfdc_d3[l_ac1].sfdd010 = g_qryparam.return4
            DISPLAY g_sfdc_d3[l_ac1].sfdd010 TO sfdd010                    #顯示到畫面上
            NEXT FIELD sfdd010                                             #返回原欄位
               
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_sfdc_d3[l_ac1].* = g_sfdc_d3_t.*
               CLOSE asrt310_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_sfdc_d3[l_ac1].sfddseq1
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_sfdc_d3[l_ac1].* = g_sfdc_d3_t.*
            ELSE
               #161006-00018#13---add---s
               IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd003) AND g_prog = 'asrt310' AND l_ooac004 = 'Y' THEN
                  IF g_sfdc_d3_t.sfdd003 <> g_sfdc_d3[l_ac1].sfdd003 OR cl_null(g_sfdc_d3_t.sfdd003) OR
                     g_sfdc_d3_t.sfdd004 <> g_sfdc_d3[l_ac1].sfdd004 OR g_sfdc_d3_t.sfdd004 IS NULL OR
                     g_sfdc_d3_t.sfdd005 <> g_sfdc_d3[l_ac1].sfdd005 OR g_sfdc_d3_t.sfdd005 IS NULL OR
                     g_sfdc_d3_t.sfdd007 <> g_sfdc_d3[l_ac1].sfdd007 THEN 
                     #申请的数据先还原
                     CALL s_inventory_ins_inap('-1',g_site,g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3_t.sfddseq1,
                                               g_sfdc_d3_t.sfdd001,g_sfdc_d3_t.sfdd013,g_sfdc_d3_t.sfdd010,
                                               g_sfdc_d3_t.sfdd003,g_sfdc_d3_t.sfdd004,g_sfdc_d3_t.sfdd005,
                                               g_sfdc_d3_t.sfdd006,g_sfdc_d3_t.sfdd007,g_sfda_m.sfdadocdt,
                                               g_sfda_m.sfda004,g_sfda_m.sfda003,g_site) RETURNING l_success                                                              
                     #按实际的再次更新                          
                     CALL s_inventory_ins_inap('1',g_site,g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,
                                               g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd013,g_sfdc_d3[l_ac1].sfdd010,
                                               g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,
                                               g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfda_m.sfdadocdt,
                                               g_sfda_m.sfda004,g_sfda_m.sfda003,g_site) RETURNING l_success
                  END IF
               END IF   
               #161006-00018#13---add---e             
               IF cl_null(g_sfdc_d3[l_ac1].sfdd003) THEN
                  LET g_sfdc_d3[l_ac1].sfdd003 = g_sfdc_d2[l_ac].sfdc012_2
               END IF
               UPDATE sfdd_t SET (sfdddocno,sfddseq,sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005,sfdd006,sfdd007,sfdd008,sfdd009,sfdd010,sfdd011) = (g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,g_sfdc_d3[l_ac1].sfddseq1,g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd002,g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd005,g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfdc_d3[l_ac1].sfdd008,g_sfdc_d3[l_ac1].sfdd009,g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd011)
                WHERE sfddent = g_enterprise
                  AND sfdddocno = g_sfda_m.sfdadocno
                  AND sfddseq = g_sfdc_d[l_ac].sfdcseq
                  AND sfddseq1 = g_sfdc_d3_t.sfddseq1 #項次  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfdd_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()

                  LET g_sfdc_d3[l_ac1].* = g_sfdc_d3_t.*                     
                  CALL s_transaction_end('N','0')
               END IF
            END IF
            LET l_time = cl_get_current()
            UPDATE sfda_t SET sfdamodid = g_user,
                              sfdamoddt = l_time
             WHERE sfdaent = g_enterprise
               AND sfdadocno = g_sfda_m.sfdadocno
            IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = "sfda_t"
                LET g_errparam.popup = TRUE
                CALL cl_err()

                LET g_sfdc_d[l_ac].* = g_sfdc_d_t.*
                CALL s_transaction_end('N','0')
            END IF
            
         AFTER ROW
            LET l_ac1 = ARR_CURR()
            LET l_ac1_t = l_ac1
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sfdc_d3[l_ac1].* = g_sfdc_d3_t.* 
               END IF
               CLOSE asrt310_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG
            END IF

            CLOSE asrt310_bcl2
            CALL s_transaction_end('Y','0')

         AFTER INPUT

      END INPUT
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         IF g_mdemand = 'Y' THEN
            NEXT FIELD sfddseq1
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD sfdadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sfdcsite
 
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
 
{<section id="asrt310.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asrt310_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
      DEFINE l_ooef004       LIKE ooef_t.ooef004
   DEFINE l_flag          LIKE type_t.num5          #标识符，TRUE/FALSE
   DEFINE l_flag1         LIKE type_t.num5          #标识符，TRUE/FALSE
   DEFINE l_oobal002      LIKE oobal_t.oobal002     #单据别
   DEFINE l_site          LIKE type_t.chr20
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
      IF l_ac = 0 OR cl_null(l_ac) THEN
      LET l_ac = 1
   END IF
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asrt310_b_fill() #單身填充
      CALL asrt310_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asrt310_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
#               INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdaownid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdaownid_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdaownid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdaowndp
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdaowndp_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdaowndp_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdacrtid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdacrtid_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdacrtid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdacrtdp
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdacrtdp_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdacrtdp_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdamodid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdamodid_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdamodid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdacnfid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdacnfid_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdacnfid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_sfda_m.sfdapstid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_sfda_m.sfdapstid_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_sfda_m.sfdapstid_desc
            
            
#            IF NOT cl_null(g_sfda_m.sfdadocno) THEN
#               CALL s_aooi200_get_site(g_sfda_m.sfdadocno) RETURNING l_flag,l_site
#               IF l_flag THEN
#                  SELECT ooef004 INTO l_ooef004
#                    FROM ooef_t
#                   WHERE ooef005 = l_site
#                     AND ooefent = g_enterprise
#               END IF
#               CALL s_aooi200_get_slip(g_sfda_m.sfdadocno) RETURNING l_flag1,l_oobal002
#               IF l_flag1 THEN
#                  IF NOT cl_null(l_oobal002) AND NOT cl_null(l_ooef004) THEN
#                     SELECT oobal004 INTO g_sfda_m.oobal004
#                       FROM oobal_t
#                      WHERE oobal001 = l_ooef004
#                        AND oobal002 = l_oobal002
#                        AND oobal003 = g_dlang
#                        AND oobalent = g_enterprise
#                  ELSE
#                     LET g_sfda_m.oobal004 = ""
#                  END IF
#               END IF
#            END IF
#            DISPLAY BY NAME g_sfda_m.oobal004
   IF NOT cl_null(g_sfda_m.sfdadocno) THEN 
            CALL asrt310_sfdadocno_desc('2',g_sfda_m.sfdadocno) RETURNING g_sfda_m.oobxl003
            DISPLAY BY NAME g_sfda_m.oobxl003
   END IF         
   CALL asrt310_desc()
            
   #end add-point
   
   #遮罩相關處理
   LET g_sfda_m_mask_o.* =  g_sfda_m.*
   CALL asrt310_sfda_t_mask()
   LET g_sfda_m_mask_n.* =  g_sfda_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sfda_m.sfdadocno,g_sfda_m.oobxl003,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001, 
       g_sfda_m.sfda004,g_sfda_m.sfda004_desc,g_sfda_m.sfda003,g_sfda_m.sfda003_desc,g_sfda_m.sfdastus, 
       g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda009_desc,g_sfda_m.sfda006,g_sfda_m.sfda006_desc, 
       g_sfda_m.sfda006_desc1,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda010_desc, 
       g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda012_desc,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtid_desc, 
       g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdamoddt, 
       g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid,g_sfda_m.sfdapstid_desc, 
       g_sfda_m.sfdapstdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfda_m.sfdastus 
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_sfdc_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      CALL asrt310_sfdc_desc()
      CALL s_feature_description(g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005) RETURNING g_success,g_sfdc_d[l_ac].sfdc005_desc   #160202-00010#1
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asrt310_detail_show()
 
   #add-point:show段之後 name="show.after"
 
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asrt310_detail_show()
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
 
{<section id="asrt310.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asrt310_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sfda_t.sfdadocno 
   DEFINE l_oldno     LIKE sfda_t.sfdadocno 
 
   DEFINE l_master    RECORD LIKE sfda_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sfdc_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_sfda_m.sfdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
    
   LET g_sfda_m.sfdadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfda_m.sfdaownid = g_user
      LET g_sfda_m.sfdaowndp = g_dept
      LET g_sfda_m.sfdacrtid = g_user
      LET g_sfda_m.sfdacrtdp = g_dept 
      LET g_sfda_m.sfdacrtdt = cl_get_current()
      LET g_sfda_m.sfdamodid = g_user
      LET g_sfda_m.sfdamoddt = cl_get_current()
      LET g_sfda_m.sfdastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfda_m.sfdastus 
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL asrt310_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sfda_m.* TO NULL
      INITIALIZE g_sfdc_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asrt310_show()
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
   CALL asrt310_set_act_visible()   
   CALL asrt310_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfdaent = " ||g_enterprise|| " AND",
                      " sfdadocno = '", g_sfda_m.sfdadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt310_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL asrt310_idx_chk()
   
   LET g_data_owner = g_sfda_m.sfdaownid      
   LET g_data_dept  = g_sfda_m.sfdaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt310_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asrt310_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sfdc_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asrt310_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfdc_t
    WHERE sfdcent = g_enterprise AND sfdcdocno = g_sfdadocno_t
 
    INTO TEMP asrt310_detail
 
   #將key修正為調整後   
   UPDATE asrt310_detail 
      #更新key欄位
      SET sfdcdocno = g_sfda_m.sfdadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sfdc_t SELECT * FROM asrt310_detail
   
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
   DROP TABLE asrt310_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt310_delete()
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
   
   IF g_sfda_m.sfdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN asrt310_cl USING g_enterprise,g_sfda_m.sfdadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt310_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt310_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
       g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
       g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
       g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt, 
       g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc,g_sfda_m.sfda009_desc, 
       g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT asrt310_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfda_m_mask_o.* =  g_sfda_m.*
   CALL asrt310_sfda_t_mask()
   LET g_sfda_m_mask_n.* =  g_sfda_m.*
   
   CALL asrt310_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      CALL s_asrt310_update_inao('2','2',g_sfda_m.sfdadocno,'','') RETURNING l_success    #151009-xianghui     
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asrt310_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sfdadocno_t = g_sfda_m.sfdadocno
 
 
      DELETE FROM sfda_t
       WHERE sfdaent = g_enterprise AND sfdadocno = g_sfda_m.sfdadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sfda_m.sfdadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
            IF NOT s_aooi200_del_docno(g_sfda_m.sfdadocno,g_sfda_m.sfdadocdt) THEN CALL s_transaction_end('N','0') RETURN END IF 
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM sfdc_t
       WHERE sfdcent = g_enterprise AND sfdcdocno = g_sfda_m.sfdadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfdc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      DELETE FROM sfdd_t
       WHERE sfddent = g_enterprise 
         AND sfdddocno = g_sfda_m.sfdadocno
 
 
      #add-point:單身刪除中
      
      #end add-point
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfdd_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF    
 
      #add by Carrier 倒扣料发料单删除时,要把sfed_t中的资料DELETE
      DELETE FROM sfed_t
       WHERE sfedent = g_enterprise
         AND sfed004 = g_sfda_m.sfdadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfed_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF  
      
      #151009-xianghui-b
      DELETE FROM inao_t
         WHERE inaoent = g_enterprise AND inaosite = g_site AND inaodocno = g_sfda_m.sfdadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "inao_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF 
      CALL s_lot_clear_detail()
      #151009-xianghui-e       
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sfda_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asrt310_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sfdc_d.clear() 
 
     
      CALL asrt310_ui_browser_refresh()  
      #CALL asrt310_ui_headershow()  
      #CALL asrt310_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
 
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asrt310_browser_fill("")
         CALL asrt310_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE asrt310_cl
 
   #功能已完成,通報訊息中心
   CALL asrt310_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asrt310.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt310_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sfdc_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF asrt310_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfdcsite,sfdcseq,sfdc004,sfdc005,sfdc006,sfdc007,sfdc008,sfdc009, 
             sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc016,sfdc015 ,t1.imaal003 ,t2.inaa002 ,t3.inab003 , 
             t4.oocql004 FROM sfdc_t",   
                     " INNER JOIN sfda_t ON sfdaent = " ||g_enterprise|| " AND sfdadocno = sfdcdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=sfdc004 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inaa_t t2 ON t2.inaaent="||g_enterprise||" AND t2.inaasite=sfdcsite AND t2.inaa001=sfdc012  ",
               " LEFT JOIN inab_t t3 ON t3.inabent="||g_enterprise||" AND t3.inab001=sfdc012 AND t3.inab002=sfdc013  ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='226' AND t4.oocql002=sfdc015 AND t4.oocql003='"||g_dlang||"' ",
 
                     " WHERE sfdcent=? AND sfdcdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
      LET g_sql = "SELECT  UNIQUE sfdcsite,sfdcseq,sfdc004,sfdc005,sfdc006,sfdc007,sfdc008,sfdc009,sfdc010, ",
         "  sfdc011,sfdc012,sfdc013,sfdc014,sfdc016,sfdc015 ,t1.imaal003 ,t2.inayl003 ,t3.inab003 ,t4.oocql004 FROM sfdc_t",            
                  " INNER JOIN sfda_t ON sfdadocno = sfdcdocno ",
                                 " LEFT JOIN imaal_t t1 ON t1.imaalent='"||g_enterprise||"' AND t1.imaal001=sfdc004 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inayl_t t2 ON t2.inaylent='"||g_enterprise||"' AND t2.inayl001=sfdc012 AND inayl002 ='",g_dlang,"'",
               " LEFT JOIN inab_t t3 ON t3.inabent='"||g_enterprise||"' AND t3.inabsite=sfdcsite AND t3.inab001=sfdc012 AND t3.inab002=sfdc013  ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent='"||g_enterprise||"' AND t4.oocql001='226' AND t4.oocql002=sfdc015 AND t4.oocql003='"||g_dlang||"' ",
                   
                  " WHERE sfdcent=? AND sfdcdocno=? "
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfdc_t.sfdcseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
            
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt310_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asrt310_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_sfda_m.sfdadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_sfda_m.sfdadocno INTO g_sfdc_d[l_ac].sfdcsite,g_sfdc_d[l_ac].sfdcseq, 
          g_sfdc_d[l_ac].sfdc004,g_sfdc_d[l_ac].sfdc005,g_sfdc_d[l_ac].sfdc006,g_sfdc_d[l_ac].sfdc007, 
          g_sfdc_d[l_ac].sfdc008,g_sfdc_d[l_ac].sfdc009,g_sfdc_d[l_ac].sfdc010,g_sfdc_d[l_ac].sfdc011, 
          g_sfdc_d[l_ac].sfdc012,g_sfdc_d[l_ac].sfdc013,g_sfdc_d[l_ac].sfdc014,g_sfdc_d[l_ac].sfdc016, 
          g_sfdc_d[l_ac].sfdc015,g_sfdc_d[l_ac].sfdc004_desc,g_sfdc_d[l_ac].sfdc012_desc,g_sfdc_d[l_ac].sfdc013_desc, 
          g_sfdc_d[l_ac].sfdc015_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
                  CALL asrt310_sfdc_desc()
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
   CALL asrt310_b_fill_1()
   IF l_ac > 1 THEN 
      LET l_ac = 1
      CALL asrt310_b_fill_2() 
   END IF 
   CALL asrt310_b_fill_3()   
   IF NOT cl_null(g_sfda_m.sfdadocno) THEN
      #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
      IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
         CALL s_lot_b_fill('2',g_site,'1',g_sfda_m.sfdadocno,'','','-1')
      ELSE
         CALL s_lot_b_fill('2',g_site,'1',g_sfda_m.sfdadocno,'','','1')
      END IF
   END IF   
   #end add-point
   
   CALL g_sfdc_d.deleteElement(g_sfdc_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt310_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sfdc_d.getLength()
      LET g_sfdc_d_mask_o[l_ac].* =  g_sfdc_d[l_ac].*
      CALL asrt310_sfdc_t_mask()
      LET g_sfdc_d_mask_n[l_ac].* =  g_sfdc_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt310_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM sfdc_t
       WHERE sfdcent = g_enterprise AND
         sfdcdocno = ps_keys_bak[1] AND sfdcseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      #add 151009 -xianghui 
      DELETE FROM sfdd_t WHERE sfddent = g_enterprise
                           AND sfdddocno = ps_keys_bak[1] 
                           AND sfddseq = ps_keys_bak[2]
      CALL s_asrt310_update_inao('2','1',ps_keys_bak[1],ps_keys_bak[2] ,'') RETURNING l_success                      
      DELETE FROM inao_t WHERE inaoent = g_enterprise
                           AND inaodocno = ps_keys_bak[1]
                           AND inaoseq = ps_keys_bak[2]                           
      #add 151009                          
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
         CALL g_sfdc_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt310_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO sfdc_t
                  (sfdcent,
                   sfdcdocno,
                   sfdcseq
                   ,sfdcsite,sfdc004,sfdc005,sfdc006,sfdc007,sfdc008,sfdc009,sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc016,sfdc015) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfdc_d[g_detail_idx].sfdcsite,g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005, 
                       g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,g_sfdc_d[g_detail_idx].sfdc008, 
                       g_sfdc_d[g_detail_idx].sfdc009,g_sfdc_d[g_detail_idx].sfdc010,g_sfdc_d[g_detail_idx].sfdc011, 
                       g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014, 
                       g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc015)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfdc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sfdc_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt310_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfdc_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL asrt310_sfdc_t_mask_restore('restore_mask_o')
               
      UPDATE sfdc_t 
         SET (sfdcdocno,
              sfdcseq
              ,sfdcsite,sfdc004,sfdc005,sfdc006,sfdc007,sfdc008,sfdc009,sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc016,sfdc015) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sfdc_d[g_detail_idx].sfdcsite,g_sfdc_d[g_detail_idx].sfdc004,g_sfdc_d[g_detail_idx].sfdc005, 
                  g_sfdc_d[g_detail_idx].sfdc006,g_sfdc_d[g_detail_idx].sfdc007,g_sfdc_d[g_detail_idx].sfdc008, 
                  g_sfdc_d[g_detail_idx].sfdc009,g_sfdc_d[g_detail_idx].sfdc010,g_sfdc_d[g_detail_idx].sfdc011, 
                  g_sfdc_d[g_detail_idx].sfdc012,g_sfdc_d[g_detail_idx].sfdc013,g_sfdc_d[g_detail_idx].sfdc014, 
                  g_sfdc_d[g_detail_idx].sfdc016,g_sfdc_d[g_detail_idx].sfdc015) 
         WHERE sfdcent = g_enterprise AND sfdcdocno = ps_keys_bak[1] AND sfdcseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfdc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfdc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt310_sfdc_t_mask_restore('restore_mask_n')
               
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
 
{<section id="asrt310.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asrt310_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt310.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asrt310_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt310.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt310_lock_b(ps_table,ps_page)
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
   #CALL asrt310_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sfdc_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt310_bcl USING g_enterprise,
                                       g_sfda_m.sfdadocno,g_sfdc_d[g_detail_idx].sfdcseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt310_bcl:",SQLERRMESSAGE 
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
 
{<section id="asrt310.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt310_unlock_b(ps_table,ps_page)
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
      CLOSE asrt310_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asrt310_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("sfdadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sfdadocno",TRUE)
      CALL cl_set_comp_entry("sfdadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
            CALL cl_set_comp_entry("sfdadocdt",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asrt310_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sfdadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
            CALL cl_set_comp_entry("sfdadocdt",FALSE)
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("sfdadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sfdadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF g_flag THEN   
      CALL cl_set_comp_entry("sfdadocno",FALSE)
      CALL cl_set_comp_entry("sfdadocdt",FALSE)
   END IF   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt310_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry("sfdc010",TRUE)
   CALL cl_set_comp_entry("sfdc016",TRUE)
   CALL cl_set_comp_entry("sfdd001",TRUE)
   CALL cl_set_comp_entry("sfdd009",TRUE)
   CALL cl_set_comp_entry("sfdd003,sfdd004,sfdd005",TRUE)     #161006-00018#13
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt310_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   DEFINE l_imaf015       LIKE imaf_t.imaf015
   DEFINE l_imaf055       LIKE imaf_t.imaf055
   DEFINE l_sys           LIKE type_t.chr80
   DEFINE l_ooba002       LIKE ooba_t.ooba002
   DEFINE l_mfg_0085      LIKE type_t.chr1    #161006-00018#13
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF cl_null(l_ac) OR l_ac = 0 THEN
      LET l_ac = 1
   END IF
   LET l_imaf015 = ""
   IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
      SELECT imaf015 INTO l_imaf015
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_sfdc_d[l_ac].sfdc004
   END IF   
   IF cl_null(l_imaf015) THEN
      CALL cl_set_comp_entry("sfdc010",FALSE)
   END IF
   
   LET l_imaf055 = ""
   IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
      SELECT imaf055 INTO l_imaf055
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_sfdc_d[l_ac].sfdc004
   END IF   
   IF l_imaf055 = '2' THEN
      CALL cl_set_comp_entry("sfdc016",FALSE)
   END IF
   LET l_ooba002 = ''
   CALL s_aooi200_get_slip(g_sfda_m.sfdadocno) RETURNING l_success,l_ooba002
   CALL cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-3235') RETURNING l_sys
   IF l_sys <> 'Y' THEN
      CALL cl_set_comp_entry("sfdd001",FALSE)
   END IF
   IF cl_null(l_ac1) OR l_ac1 = 0 THEN
      LET l_ac1 = 1
   END IF
   LET l_imaf015 = ""
   IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd001) THEN
      SELECT imaf015 INTO l_imaf015
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_sfdc_d3[l_ac1].sfdd001
   END IF   
   IF cl_null(l_imaf015) THEN
      CALL cl_set_comp_entry("sfdd009",FALSE)
   END IF
   
   #161006-00018#13---add---s
   CALL cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0085') RETURNING l_mfg_0085 
   IF l_mfg_0085 <> 'Y' THEN
      IF NOT cl_null(g_sfdc_d[l_ac].sfdc012) THEN 
         CALL cl_set_comp_entry("sfdd003",FALSE)
      END IF
      IF NOT cl_null(g_sfdc_d[l_ac].sfdc013) THEN 
         CALL cl_set_comp_entry("sfdd004",FALSE)
      END IF 
      IF NOT cl_null(g_sfdc_d[l_ac].sfdc014) THEN 
         CALL cl_set_comp_entry("sfdd005",FALSE)
      END IF       
   END IF
   #161006-00018#13---add---e
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asrt310_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)
   CALL cl_set_act_visible("mdemand,s_lot_sel",TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asrt310_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_sfda_m.sfdastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF g_sfda_m.sfdastus <> 'Y' THEN    
      CALL cl_set_act_visible("mdemand,s_lot_sel",FALSE)
   END IF  
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asrt310_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   CALL cl_set_act_visible("s_lot_sel",TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asrt310_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   IF g_sfda_m.sfdastus <> 'Y' THEN    
      CALL cl_set_act_visible("s_lot_sel",FALSE)
   END IF  
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt310_default_search()
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
      LET ls_wc = ls_wc, " sfdadocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "sfda_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfdc_t" 
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
 
{<section id="asrt310.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION asrt310_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
 
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sfda_m.sfdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN asrt310_cl USING g_enterprise,g_sfda_m.sfdadocno
   IF STATUS THEN
      CLOSE asrt310_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt310_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
       g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
       g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
       g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfdt, 
       g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc,g_sfda_m.sfda009_desc, 
       g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT asrt310_action_chk() THEN
      CLOSE asrt310_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfda_m.sfdadocno,g_sfda_m.oobxl003,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001, 
       g_sfda_m.sfda004,g_sfda_m.sfda004_desc,g_sfda_m.sfda003,g_sfda_m.sfda003_desc,g_sfda_m.sfdastus, 
       g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda009_desc,g_sfda_m.sfda006,g_sfda_m.sfda006_desc, 
       g_sfda_m.sfda006_desc1,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda010_desc, 
       g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda012_desc,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtid_desc, 
       g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid,g_sfda_m.sfdaownid_desc, 
       g_sfda_m.sfdaowndp,g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid,g_sfda_m.sfdamodid_desc,g_sfda_m.sfdamoddt, 
       g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid,g_sfda_m.sfdapstid_desc, 
       g_sfda_m.sfdapstdt
 
   CASE g_sfda_m.sfdastus
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "S"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_sfda_m.sfdastus
            
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "S"
               HIDE OPTION "posted"
            WHEN "X"
               HIDE OPTION "invalid"
            WHEN "Z"
               HIDE OPTION "unposted"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
            CALL cl_set_act_visible("withdraw,signing,approved,rejection", FALSE)
            CASE g_sfda_m.sfdastus
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "N"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "posted"
               HIDE OPTION "unposted"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "X"
               HIDE OPTION "invalid"
            WHEN "Y"
               HIDE OPTION "confirmed"
               HIDE OPTION "invalid"
               HIDE OPTION "unposted"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "S"
               HIDE OPTION "posted"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "confirmed"
               HIDE OPTION "invalid"
            
        END CASE
#            IF g_sfda_m.sfdastus = 'S' THEN
#               CALL cl_set_act_visible("unconfirmed,confirmed,invalid", FALSE)
#            ELSE
#               CALL cl_set_act_visible("unconfirmed,confirmed,invalid", TRUE)
#            END IF
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT asrt310_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt310_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT asrt310_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt310_cl
            RETURN
         END IF
 
 
 
	  
      #ON ACTION withdraw
      #   IF cl_auth_chk_act("withdraw") THEN
      #      LET lc_state = "D"
      #      #add-point:action控制 name="statechange.withdraw"
      #   
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            CALL s_transaction_begin()
            IF NOT s_asrt310_uconf_chk(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
               CALL s_transaction_end('N','0')
               RETURN
            ELSE
               IF NOT cl_ask_confirm('aim-00110') THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  IF NOT s_asrt310_uconf_upd(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
                     CALL s_transaction_end('N','0')
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF
            END IF            
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
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            CALL s_transaction_begin()
            IF NOT s_asrt310_conf_chk(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
               CALL s_transaction_end('N','0')
               RETURN
            ELSE
               IF NOT cl_ask_confirm('aim-00108') THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  IF NOT s_asrt310_conf_upd(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
                     CALL s_transaction_end('N','0')
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF
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
      ON ACTION rejection
         IF cl_auth_chk_act("rejection") THEN
            LET lc_state = "R"
            #add-point:action控制 name="statechange.rejection"
         
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"

            CALL s_transaction_begin()
            IF NOT s_asrt310_post_chk(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
               CLOSE asrt310_cl    #161006-00018#13
               CALL s_transaction_end('N','0')
               RETURN
            ELSE
               IF NOT cl_ask_confirm('sub-00232') THEN
                  CLOSE asrt310_cl    #161006-00018#13
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  IF NOT s_asrt310_post_upd(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
                     CLOSE asrt310_cl    #161006-00018#13
                     CALL s_transaction_end('N','0')
                     RETURN
                  ELSE
                     CLOSE asrt310_cl    #161006-00018#13
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF
            END IF
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
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"

            LET lc_state = "Y"
            CALL s_transaction_begin()
            IF NOT s_asrt310_upost_chk(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
               CLOSE asrt310_cl    #161006-00018#13
               CALL s_transaction_end('N','0')
               RETURN
            ELSE
               IF NOT cl_ask_confirm('sub-00233') THEN
                  CLOSE asrt310_cl    #161006-00018#13
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  IF NOT s_asrt310_upost_upd(g_sfda_m.sfdadocno,g_sfda_m.sfdastus) THEN
                     CLOSE asrt310_cl    #161006-00018#13
                     CALL s_transaction_end('N','0')
                     RETURN
                  ELSE
                     CLOSE asrt310_cl    #161006-00018#13
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF
            END IF          
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
 
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "D" 
      AND lc_state <> "N"
      AND lc_state <> "W"
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "R"
      AND lc_state <> "S"
      AND lc_state <> "X"
      AND lc_state <> "Z"
      ) OR 
      g_sfda_m.sfdastus = lc_state OR cl_null(lc_state) THEN
      CLOSE asrt310_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #151125-00001#4 --- add start ---
   IF lc_state = 'X' THEN
      IF NOT cl_ask_confirm('aim-00109') THEN
         CLOSE asrt310_cl    #161006-00018#13
         CALL s_transaction_end('N','0') 
         RETURN
      END IF
   END IF
   #151125-00001#4 --- add end   ---
   #end add-point
   
   LET g_sfda_m.sfdamodid = g_user
   LET g_sfda_m.sfdamoddt = cl_get_current()
   LET g_sfda_m.sfdastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sfda_t 
      SET (sfdastus,sfdamodid,sfdamoddt) 
        = (g_sfda_m.sfdastus,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt)     
    WHERE sfdaent = g_enterprise AND sfdadocno = g_sfda_m.sfdadocno
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE asrt310_master_referesh USING g_sfda_m.sfdadocno INTO g_sfda_m.sfdadocno,g_sfda_m.sfdasite, 
          g_sfda_m.sfdadocdt,g_sfda_m.sfda001,g_sfda_m.sfda004,g_sfda_m.sfda003,g_sfda_m.sfdastus,g_sfda_m.sfda002, 
          g_sfda_m.sfda009,g_sfda_m.sfda006,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda011, 
          g_sfda_m.sfda012,g_sfda_m.sfda013,g_sfda_m.sfdacrtid,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdt, 
          g_sfda_m.sfdaownid,g_sfda_m.sfdaowndp,g_sfda_m.sfdamodid,g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid, 
          g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid,g_sfda_m.sfdapstdt,g_sfda_m.sfda004_desc,g_sfda_m.sfda003_desc, 
          g_sfda_m.sfda009_desc,g_sfda_m.sfda010_desc,g_sfda_m.sfda012_desc,g_sfda_m.sfdacrtid_desc, 
          g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdaownid_desc,g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid_desc, 
          g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdapstid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sfda_m.sfdadocno,g_sfda_m.oobxl003,g_sfda_m.sfdasite,g_sfda_m.sfdadocdt,g_sfda_m.sfda001, 
          g_sfda_m.sfda004,g_sfda_m.sfda004_desc,g_sfda_m.sfda003,g_sfda_m.sfda003_desc,g_sfda_m.sfdastus, 
          g_sfda_m.sfda002,g_sfda_m.sfda009,g_sfda_m.sfda009_desc,g_sfda_m.sfda006,g_sfda_m.sfda006_desc, 
          g_sfda_m.sfda006_desc1,g_sfda_m.sfda007,g_sfda_m.sfda008,g_sfda_m.sfda010,g_sfda_m.sfda010_desc, 
          g_sfda_m.sfda011,g_sfda_m.sfda012,g_sfda_m.sfda012_desc,g_sfda_m.sfda013,g_sfda_m.sfdacrtid, 
          g_sfda_m.sfdacrtid_desc,g_sfda_m.sfdacrtdp,g_sfda_m.sfdacrtdp_desc,g_sfda_m.sfdacrtdt,g_sfda_m.sfdaownid, 
          g_sfda_m.sfdaownid_desc,g_sfda_m.sfdaowndp,g_sfda_m.sfdaowndp_desc,g_sfda_m.sfdamodid,g_sfda_m.sfdamodid_desc, 
          g_sfda_m.sfdamoddt,g_sfda_m.sfdacnfid,g_sfda_m.sfdacnfid_desc,g_sfda_m.sfdacnfdt,g_sfda_m.sfdapstid, 
          g_sfda_m.sfdapstid_desc,g_sfda_m.sfdapstdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   IF g_sfda_m.sfdastus = 'S' THEN
   
      #160604-00034#13-s add
      LET g_sfda_m.sfda001 = g_today  #过账日期
      DISPLAY BY NAME g_sfda_m.sfda001
      #若aoos020"進銷存過帳日期控管方式"參數設定為"不可修改"時，則將過帳日期關閉
      IF NOT cl_chk_update_pstdt() THEN
         CALL cl_set_comp_entry("sfda001",FALSE)  
      END IF
      #160604-00034#13-e add
      
      INPUT BY NAME g_sfda_m.sfda001
         BEFORE INPUT 
            LET g_sfda_m.sfda001 = g_today
          
         AFTER INPUT
            UPDATE sfda_t 
               SET sfda001 = g_sfda_m.sfda001  
             WHERE sfdaent = g_enterprise
               AND sfdadocno = g_sfda_m.sfdadocno     
      END INPUT 
   END IF
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE asrt310_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt310_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt310.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asrt310_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
      IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_sfdc_d2.getLength() THEN
         LET g_detail_idx = g_sfdc_d2.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfdc_d2.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfdc_d2.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_sfdc_d3.getLength() THEN
         LET g_detail_idx = g_sfdc_d3.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfdc_d3.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfdc_d3.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 4 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_sfdc_d4.getLength() THEN
         LET g_detail_idx = g_sfdc_d4.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfdc_d4.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfdc_d4.getLength() TO FORMONLY.cnt
   END IF
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sfdc_d.getLength() THEN
         LET g_detail_idx = g_sfdc_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfdc_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfdc_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt310_b_fill2(pi_idx)
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
   CALL asrt310_b_fill_2()
   CALL asrt310_b_fill_3()
   IF NOT cl_null(g_sfda_m.sfdadocno) THEN 
      #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
      IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
         CALL s_lot_b_fill('2',g_site,'1',g_sfda_m.sfdadocno,'','','-1')
      ELSE
         CALL s_lot_b_fill('2',g_site,'1',g_sfda_m.sfdadocno,'','','1')
      END IF
   END IF    
   #end add-point
    
   LET l_ac = li_ac
   
   CALL asrt310_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asrt310_fill_chk(ps_idx)
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
 
{<section id="asrt310.status_show" >}
PRIVATE FUNCTION asrt310_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrt310.mask_functions" >}
&include "erp/asr/asrt310_mask.4gl"
 
{</section>}
 
{<section id="asrt310.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION asrt310_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL asrt310_show()
   CALL asrt310_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_sfda_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_sfdc_d))
 
 
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
   #CALL asrt310_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL asrt310_ui_headershow()
   CALL asrt310_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION asrt310_draw_out()
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
   CALL asrt310_ui_headershow()  
   CALL asrt310_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="asrt310.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asrt310_set_pk_array()
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
   LET g_pk_array[1].values = g_sfda_m.sfdadocno
   LET g_pk_array[1].column = 'sfdadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt310.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asrt310.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asrt310_msgcentre_notify(lc_state)
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
   CALL asrt310_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sfda_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt310.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asrt310_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#37-s
   SELECT sfdastus INTO g_sfda_m.sfdastus FROM sfda_t
    WHERE sfdaent = g_enterprise
      AND sfdasite = g_site
      AND sfdadocno = g_sfda_m.sfdadocno
   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_sfda_m.sfdastus
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
        LET g_errparam.extend = g_sfda_m.sfdadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL asrt310_set_act_visible()
        CALL asrt310_set_act_no_visible()
        CALL asrt310_show()
        RETURN FALSE
     END IF
   END IF      
   #160818-00017#37-e
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt310.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 顯示單據說明
# Memo...........:
# Usage..........: CALL asrt310_get_oobal004()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/20 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_get_oobal004()
#DEFINE l_ooef004       LIKE ooef_t.ooef004 
#DEFINE l_ooba002       LIKE ooba_t.ooba002
#
#   LET l_ooba002 = ''
#   CALL s_aooi200_get_slip(g_sfda_m.sfdadocno) RETURNING l_success,l_ooba002
#   LET l_ooef004 = ""
#   LET g_sfda_m.oobal004 = ""
#   SELECT ooef004 INTO l_ooef004
#     FROM ooef_t
#    WHERE ooef001 = g_site
#      AND ooefent = g_enterprise
#   IF NOT cl_null(l_ooef004) THEN
#      SELECT oobal004 INTO g_sfda_m.oobal004
#        FROM oobal_t
#       WHERE oobal001 = l_ooef004
#         AND oobal002 = l_ooba002
#         AND oobal003 = g_dlang
#         AND oobalent = g_enterprise
#   END IF
#   DISPLAY BY NAME g_sfda_m.oobal004
END FUNCTION
################################################################################
# Descriptions...: 單頭參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt310_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/20 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_desc()
DEFINE l_ooag002       LIKE ooag_t.ooag002

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfda_m.sfda003
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfda_m.sfda003_desc =  g_rtn_fields[1]
   DISPLAY BY NAME g_sfda_m.sfda003_desc
      
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfda_m.sfda009
   CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srzasite ='"||g_site||"'  AND srza001=? ","") RETURNING g_rtn_fields
   LET g_sfda_m.sfda009_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sfda_m.sfda009_desc
   
   SELECT ooag002 INTO l_ooag002
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = g_sfda_m.sfda004
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_ooag002
   CALL ap_ref_array2(g_ref_fields,"SELECT oofa011 FROM oofa_t WHERE oofaent='"||g_enterprise||"' AND oofa002='2' AND oofa001=? ","") RETURNING g_rtn_fields
   LET g_sfda_m.sfda004_desc =  g_rtn_fields[1] 
   DISPLAY BY NAME g_sfda_m.sfda004_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfda_m.sfda010
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfda_m.sfda010_desc =  g_rtn_fields[1] 
   DISPLAY BY NAME g_sfda_m.sfda010_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfda_m.sfda012
   CALL ap_ref_array2(g_ref_fields,"SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite = '"||g_site||"' AND inaa001=? ","") RETURNING g_rtn_fields
   LET g_sfda_m.sfda012_desc =  g_rtn_fields[1] 
   DISPLAY BY NAME g_sfda_m.sfda012_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfda_m.sfda006
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001 = ? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfda_m.sfda006_desc =  g_rtn_fields[1] 
   LET g_sfda_m.sfda006_desc1 =  g_rtn_fields[2] 
   DISPLAY BY NAME g_sfda_m.sfda006_desc
   DISPLAY BY NAME g_sfda_m.sfda006_desc1
END FUNCTION
################################################################################
# Descriptions...: 單別檢查
# Memo...........:
# Usage..........: CALL asrt310_chk_sfdadocno()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_sfdadocno()
DEFINE l_n      LIKE type_t.num5

   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM oobl_t
    WHERE oobl001 IN (SELECT ooef004 FROM ooef_t
                       WHERE ooef001 = g_site
                         AND ooefent = g_enterprise )
      AND oobl002 = g_sfda_m.sfdadocno
      AND ooblent = g_enterprise
      AND oobl003 = g_prog
    IF l_n = 0 THEN
       LET g_errno = 'abm-00066'
    END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查生產料號+BOM特性+產品特徵+生產控制組需存在存同年月的asrt300內
# Memo...........:
# Usage..........: CALL asrt310_chk_srab()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_srab()
DEFINE l_n      LIKE type_t.num5

   LET g_errno = ""
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   IF NOT cl_null(g_sfda_m.sfda006) AND g_sfda_m.sfda007 IS NOT NULL AND g_sfda_m.sfda008 IS NOT NULL AND NOT cl_null(g_sfda_m.sfda009) THEN
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM sraa_t,srab_t
       WHERE sraaent = srabent
         AND sraasite = srabsite
         AND sraa000 = srab000
         AND sraa001 = srab001
         AND sraa002 = srab002
         AND sraa003 = srab003
         AND srabent = g_enterprise
         AND srabsite = g_site
         AND srab001 = g_sfda_m.sfda009
         AND srab002 = l_year
         AND srab003 = l_month 
         AND srab004 = g_sfda_m.sfda006
         AND srab005 = g_sfda_m.sfda007
         AND srab006 = g_sfda_m.sfda008
      IF l_n = 0 THEN
         LET g_errno = 'asr-00001'
      ELSE
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM sraa_t,srab_t
          WHERE sraaent = srabent
            AND sraasite = srabsite
            AND sraa000 = srab000
            AND sraa001 = srab001
            AND sraa002 = srab002
            AND sraa003 = srab003
            AND srabent = g_enterprise
            AND srabsite = g_site
            AND srab001 = g_sfda_m.sfda009
            AND srab002 = l_year
            AND srab003 = l_month 
            AND srab004 = g_sfda_m.sfda006
            AND srab005 = g_sfda_m.sfda007
            AND srab006 = g_sfda_m.sfda008
            AND sraastus = 'Y'
         IF l_n = 0 THEN
            LET g_errno = 'asr-00026'
         END IF
      END IF
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查BOM中是否有此作業編號
# Memo...........:
# Usage..........: CALL asrt310_chk_bmba007()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_bmba007()
DEFINE l_n       LIKE type_t.num5
   
   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM bmba_t
    WHERE bmbaent = g_enterprise
      AND bmbasite = g_site
      AND bmba007 = g_sfda_m.sfda010
   IF l_n = 0 THEN
      LET g_errno = 'abm-00012'
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查BOM中是否有此作業編號+制程序
# Memo...........:
# Usage..........: CALL asrt310_chk_bmba()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_bmba()
DEFINE l_n      LIKE type_t.num5
   
   LET g_errno = ""
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   IF g_sfda_m.sfda010 IS NOT NULL AND g_sfda_m.sfda011 IS NOT NULL AND g_sfda_m.sfda007 IS NOT NULL AND NOT cl_null(g_sfda_m.sfda006) THEN               
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM bmaa_t,bmba_t
       WHERE bmaaent = bmbaent
         AND bmaasite = bmbasite
         AND bmaa001 = bmba001
         AND bmaa002 = bmba002
         AND bmbaent = g_enterprise
         AND bmbasite = g_site
         AND bmba001 = g_sfda_m.sfda006
         AND bmba002 = g_sfda_m.sfda007
         AND bmba007 = g_sfda_m.sfda010
         AND bmba008 = g_sfda_m.sfda011
      IF l_n = 0 THEN
         LET g_errno = 'asr-00002'
      ELSE
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM bmaa_t,bmba_t
          WHERE bmaaent = bmbaent
            AND bmaasite = bmbasite
            AND bmaa001 = bmba001
            AND bmaa002 = bmba002
            AND bmbaent = g_enterprise
            AND bmbasite = g_site
            AND bmba001 = g_sfda_m.sfda006
            AND bmba002 = g_sfda_m.sfda007
            AND bmba007 = g_sfda_m.sfda010
            AND bmba008 = g_sfda_m.sfda011
            AND bmaastus = 'Y'
         IF l_n = 0 THEN
            LET g_errno = 'asr-00027'
         END IF
      END IF
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查生產料號需存在存同年月的asrt300內
# Memo...........:
# Usage..........: CALL asrt310_chk_srab004()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_srab004()
DEFINE l_n       LIKE type_t.num5
   
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab002 = l_year
      AND srab003 = l_month
      AND srab004 = g_sfda_m.sfda006
   IF l_n = 0 THEN
      LET g_errno = 'asr-00003'
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查生產料號需存在存同年月的asrt300內
# Memo...........:
# Usage..........: CALL asrt310_chk_srab005()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_srab005()
DEFINE l_n       LIKE type_t.num5
   
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab002 = l_year
      AND srab003 = l_month
      AND srab005 = g_sfda_m.sfda007
   IF l_n = 0 THEN
      LET g_errno = 'asr-00003'
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查生產料號需存在存同年月的asrt300內
# Memo...........:
# Usage..........: CALL asrt310_chk_srab006()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_srab006()
DEFINE l_n       LIKE type_t.num5
   
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab002 = l_year
      AND srab003 = l_month
      AND srab006 = g_sfda_m.sfda008
   IF l_n = 0 THEN
      LET g_errno = 'asr-00003'
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查生產料號需存在存同年月的asrt300內
# Memo...........:
# Usage..........: CALL asrt310_chk_srab001()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_srab001()
DEFINE l_n       LIKE type_t.num5
   
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab002 = l_year
      AND srab003 = l_month
      AND srab001 = g_sfda_m.sfda009
   IF l_n = 0 THEN
      LET g_errno = 'asr-00003'
   END IF
END FUNCTION
################################################################################
# Descriptions...: 套數預設值
# Memo...........: 程序為asrt310時預設單據日期在asrt300內的計畫量-已發套數+已退套數
# Usage..........: CALL asrt310_def_sfda013()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_def_sfda013()
DEFINE l_srab010      LIKE srab_t.srab010
DEFINE l_sfda013_f    LIKE sfda_t.sfda013
DEFINE l_sfda013_t    LIKE sfda_t.sfda013
    
   IF cl_null(g_sfda_m.sfdadocdt) OR cl_null(g_sfda_m.sfda006) OR  cl_null(g_sfda_m.sfda009) THEN
      RETURN
   END IF
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   
   IF cl_null(g_sfda_m.sfda007) THEN
      LET g_sfda_m.sfda007 = ' '
   END IF
   IF cl_null(g_sfda_m.sfda008) THEN
      LET g_sfda_m.sfda008 = ' '
   END IF
   #asrt300計劃量
   SELECT srab010 INTO l_srab010
     FROM sraa_t,srab_t
    WHERE sraaent = srabent
      AND sraasite = srabsite
      AND sraa000 = srab000
      AND sraa001 = srab001
      AND sraa002 = srab002
      AND sraa003 = srab003
      AND srabent = g_enterprise
      AND srabsite = g_site
      AND srab001 = g_sfda_m.sfda009
      AND srab002 = l_year
      AND srab003 = l_month
      AND srab004 = g_sfda_m.sfda006
      AND srab005 = g_sfda_m.sfda007
      AND srab006 = g_sfda_m.sfda008
      AND srab009 = g_sfda_m.sfdadocdt
      AND sraastus = 'Y'
   IF cl_null(l_srab010) THEN
      LET l_srab010 = 0
   END IF
   #已發套數
   SELECT SUM(sfda013) INTO l_sfda013_f
     FROM sfda_t
    WHERE sfdaent = g_enterprise
      AND sfdadocdt = g_sfda_m.sfdadocdt
      AND sfda002 = '16'
      AND sfda006 = g_sfda_m.sfda006
      AND sfda007 = g_sfda_m.sfda007
      AND sfda008 = g_sfda_m.sfda008
      AND sfda009 = g_sfda_m.sfda009
      AND sfdastus ='S'
   IF cl_null(l_sfda013_f) THEN
      LET l_sfda013_f = 0
   END IF
   #已退套數
   SELECT SUM(sfda013) INTO l_sfda013_t
     FROM sfda_t
    WHERE sfdaent = g_enterprise
      AND sfdadocdt = g_sfda_m.sfdadocdt
      AND sfda002 = '26'
      AND sfda006 = g_sfda_m.sfda006
      AND sfda007 = g_sfda_m.sfda007
      AND sfda008 = g_sfda_m.sfda008
      AND sfda009 = g_sfda_m.sfda009
      AND sfdastus ='S'
   IF cl_null(l_sfda013_t) THEN
      LET l_sfda013_t = 0
   END IF
   LET g_sfda_m.sfda013 = l_srab010 - l_sfda013_f + l_sfda013_t
END FUNCTION
################################################################################
# Descriptions...: 發料需求單身參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt310_sfdc_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_sfdc_desc()
   LET g_sfdc_d[l_ac].sfdc008_desc = g_sfdc_d[l_ac].sfdc007 - g_sfdc_d[l_ac].sfdc008
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc008_desc
               
   LET g_sfdc_d[l_ac].sfdc011_desc = g_sfdc_d[l_ac].sfdc010 - g_sfdc_d[l_ac].sfdc011
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc011_desc
               
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfdc_d[l_ac].sfdc004
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfdc_d[l_ac].sfdc004_desc = g_rtn_fields[1]
   LET g_sfdc_d[l_ac].sfdc004_desc1 = g_rtn_fields[2]
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc004_desc
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc004_desc1

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfdc_d[l_ac].sfdc012
   CALL ap_ref_array2(g_ref_fields,"SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite= '"||g_site||"' AND inaa001=? ","") RETURNING g_rtn_fields
   LET g_sfdc_d[l_ac].sfdc012_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc012_desc

   IF NOT cl_null(g_sfdc_d[l_ac].sfdc013) THEN
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_sfdc_d[l_ac].sfdc012
      LET g_ref_fields[2] = g_sfdc_d[l_ac].sfdc013
      CALL ap_ref_array2(g_ref_fields,"SELECT inab003 FROM inab_t WHERE inabent='"||g_enterprise||"' AND inabsite= '"||g_site||"' AND inab001=? AND inab002=? ","") RETURNING g_rtn_fields
      LET g_sfdc_d[l_ac].sfdc013_desc = g_rtn_fields[1]
   ELSE
      LET g_sfdc_d[l_ac].sfdc013_desc = ''
   END IF
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc013_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfdc_d[l_ac].sfdc015
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='"||g_acc||"' AND oocql002 = ? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfdc_d[l_ac].sfdc015_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sfdc_d[l_ac].sfdc015_desc
   
   CALL asrt310_imaf034_imae092()
END FUNCTION
################################################################################
# Descriptions...: 檢查生產料號是否允許特徵輸入
# Memo...........:
# Usage..........: CALL asrt310_chk_sfdc005()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/22 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_sfdc005()
DEFINE l_imaa005         LIKE imaa_t.imaa005
DEFINE l_n               LIKE type_t.num5

   LET g_errno = ""
   LET l_imaa005 = ""
   SELECT imaa005 INTO l_imaa005
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = g_sfda_m.sfda006
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM imeb_t
    WHERE imebent = g_enterprise
      AND imeb001 = l_imaa005
      AND imeb004 = g_sfdc_d[l_ac].sfdc005
   IF l_n  = 0 THEN
      LET g_errno = 'aec-00017'
   END IF

END FUNCTION
################################################################################
# Descriptions...: 需求料號帶值
# Memo...........:
# Usage..........: CALL asrt310_sfdc004_def()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/22 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_sfdc004_def()
      
   SELECT imae081 INTO g_sfdc_d[l_ac].sfdc006
     FROM imae_t
    WHERE imaeent = g_enterprise
      AND imaesite = g_site
      AND imae001 = g_sfdc_d[l_ac].sfdc004
    
   SELECT imaf015 INTO g_sfdc_d[l_ac].sfdc009
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = g_site
      AND imaf001 = g_sfdc_d[l_ac].sfdc004
END FUNCTION
################################################################################
# Descriptions...: s_detail2填充数据
# Memo...........:
# Usage..........: CALL asrt310_b_fill_1()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/25 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_b_fill_1()
   CALL g_sfdc_d2.clear()    #g_sfdc_d2單身 

   LET g_sql = "SELECT UNIQUE sfdcseq,sfdc004,'','',sfdc005,'','',sfdc006,sfdc007,sfdc008,'',sfdc009,sfdc010,sfdc011,'',sfdc012,'',sfdc013,'',sfdc014,sfdc016,sfdc015,'' FROM sfdc_t",   
               " INNER JOIN sfda_t ON sfdadocno = sfdcdocno ",
               " WHERE sfdcent=?  AND sfdcdocno=?"
   
   IF NOT cl_null(g_wc2_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
   END IF
   
   #子單身的WC
   LET g_sql = g_sql, " ORDER BY sfdc_t.sfdcseq"

   
   PREPARE asrt310_pb1 FROM g_sql
   DECLARE b_fill_cs1 CURSOR FOR asrt310_pb1
   
   LET g_cnt = l_ac
   LET l_ac = 1
   
   OPEN b_fill_cs1 USING g_enterprise,g_sfda_m.sfdadocno
   
                                            
   FOREACH b_fill_cs1 INTO g_sfdc_d2[l_ac].sfdcseq_2,g_sfdc_d2[l_ac].sfdc004_2,g_sfdc_d2[l_ac].sfdc004_2_desc,g_sfdc_d2[l_ac].sfdc004_2_desc1,g_sfdc_d2[l_ac].sfdc005_2,g_sfdc_d2[l_ac].imaf034_2,g_sfdc_d2[l_ac].imae092_2,g_sfdc_d2[l_ac].sfdc006_2,g_sfdc_d2[l_ac].sfdc007_2,g_sfdc_d2[l_ac].sfdc008_2,g_sfdc_d2[l_ac].sfdc008_2_desc,g_sfdc_d2[l_ac].sfdc009_2,g_sfdc_d2[l_ac].sfdc010_2,g_sfdc_d2[l_ac].sfdc011_2,g_sfdc_d2[l_ac].sfdc011_2_desc,g_sfdc_d2[l_ac].sfdc012_2,g_sfdc_d2[l_ac].sfdc012_2_desc,g_sfdc_d2[l_ac].sfdc013_2,g_sfdc_d2[l_ac].sfdc013_2_desc,g_sfdc_d2[l_ac].sfdc014_2,g_sfdc_d2[l_ac].sfdc016_2,g_sfdc_d2[l_ac].sfdc015_2,g_sfdc_d2[l_ac].sfdc015_2_desc
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      CALL asrt310_sfdc_2_desc()
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   CALL g_sfdc_d2.deleteElement(g_sfdc_d2.getLength())

   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt310_pb1
END FUNCTION
################################################################################
# Descriptions...: s_detail3填充数据
# Memo...........:
# Usage..........: CALL asrt310_b_fill_2()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/25 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_b_fill_2()
   
   
   IF l_ac < 1 OR cl_null(l_ac) THEN RETURN END IF
   
   CALL g_sfdc_d3.clear()    #g_sfdc_d3單身 

   LET g_sql = "SELECT UNIQUE sfddseq1,sfdd001,'','',sfdd013,sfdd002,sfdd003,'',sfdd004,'',sfdd005,sfdd010,sfdd006,sfdd007,sfdd008,sfdd009,sfdd011 ",
               "  FROM sfdd_t",
               " WHERE sfddent=?  AND sfdddocno=? AND sfddseq = ? "
   
#   IF g_prog = 'asrt310' THEN
#      LET g_sql = g_sql CLIPPED, " AND sfdd012 = -1 "
#   END IF
#   IF g_prog = 'asrt320' THEN
#      LET g_sql = g_sql CLIPPED, " AND sfdd012 = 1 "
#   END IF
   IF NOT cl_null(g_wc3_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc3_table1 CLIPPED
   END IF
   
   #子單身的WC
   LET g_sql = g_sql, " ORDER BY sfdd_t.sfddseq1"

   
   PREPARE asrt310_pb2 FROM g_sql
   DECLARE b_fill_cs2 CURSOR FOR asrt310_pb2
   
   LET g_cnt = l_ac1
   LET l_ac1 = 1
   
   OPEN b_fill_cs2 USING g_enterprise,g_sfda_m.sfdadocno,g_sfdc_d2[l_ac].sfdcseq_2
   
                                            
   FOREACH b_fill_cs2 INTO g_sfdc_d3[l_ac1].sfddseq1,g_sfdc_d3[l_ac1].sfdd001,g_sfdc_d3[l_ac1].sfdd001_desc,g_sfdc_d3[l_ac1].sfdd001_desc1,g_sfdc_d3[l_ac1].sfdd013,g_sfdc_d3[l_ac1].sfdd002,g_sfdc_d3[l_ac1].sfdd003,g_sfdc_d3[l_ac1].sfdd003_desc,g_sfdc_d3[l_ac1].sfdd004,g_sfdc_d3[l_ac1].sfdd004_desc,g_sfdc_d3[l_ac1].sfdd005,g_sfdc_d3[l_ac1].sfdd010,g_sfdc_d3[l_ac1].sfdd006,g_sfdc_d3[l_ac1].sfdd007,g_sfdc_d3[l_ac1].sfdd008,g_sfdc_d3[l_ac1].sfdd009,g_sfdc_d3[l_ac1].sfdd011
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      CALL asrt310_sfdd_desc()
      LET l_ac1 = l_ac1 + 1
      IF l_ac1 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   CALL g_sfdc_d3.deleteElement(g_sfdc_d3.getLength())

   LET l_ac1 = g_cnt
   LET g_cnt = 0  
   
   FREE asrt310_pb2
END FUNCTION
################################################################################
# Descriptions...: s_detail4單身填充
# Memo...........:
# Usage..........: CALL asrt310_b_fill_3()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/26 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_b_fill_3()
   
   CALL g_sfdc_d4.clear()

   LET g_sql = "SELECT UNIQUE inaoseq,inaoseq1,inaoseq2,inao001,'','',inao008,inao009,inao010,inao012 ",
               "  FROM inao_t ",
               " WHERE inaoent=? AND inaosite=? AND inaodocno=? AND inao000 = '2'"
   LET g_sql = g_sql, " ORDER BY inaoseq,inaoseq1,inaoseq2"

   PREPARE asrt310_inao_pb1 FROM g_sql
   DECLARE inao_b_fill_cs1 CURSOR FOR asrt310_inao_pb1

   LET g_cnt = l_ac2
   LET l_ac2 = 1

   OPEN inao_b_fill_cs1 USING g_enterprise, g_site,g_sfda_m.sfdadocno
   FOREACH inao_b_fill_cs1 INTO g_sfdc_d4[l_ac2].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      CALL asrt310_inao_desc()
      LET l_ac2 = l_ac2 + 1
      IF l_ac2 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0
   CALL g_sfdc_d4.deleteElement(g_sfdc_d4.getLength())
   LET g_rec_b2 = g_sfdc_d4.getLength()
   LET l_ac2 = g_cnt
   LET g_cnt = 0

   FREE asrt310_inao_pb1
END FUNCTION
################################################################################
# Descriptions...: 製造批序號單身參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt310_inao_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/26 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_inao_desc()
   SELECT imaal003,imaal004 
     INTO g_sfdc_d4[l_ac2].inao001_desc,g_sfdc_d4[l_ac2].inao001_desc2
     FROM imaal_t 
    WHERE imaalent = g_enterprise 
      AND imaal001 = g_sfdc_d4[l_ac2].inao001 
      AND imaal002 = g_dlang
   DISPLAY BY NAME g_sfdc_d4[l_ac2].inao001_desc,g_sfdc_d4[l_ac2].inao001_desc2
END FUNCTION
################################################################################
# Descriptions...: 發料明細第一個單身參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt310_sfdc_2_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/26 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_sfdc_2_desc()
   LET g_sfdc_d2[l_ac].sfdc008_2_desc = g_sfdc_d2[l_ac].sfdc007_2 - g_sfdc_d2[l_ac].sfdc008_2
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc008_2_desc
               
   LET g_sfdc_d2[l_ac].sfdc011_2_desc = g_sfdc_d2[l_ac].sfdc010_2 - g_sfdc_d2[l_ac].sfdc011_2
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc011_2_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfdc_d2[l_ac].sfdc004_2
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfdc_d2[l_ac].sfdc004_2_desc = g_rtn_fields[1]
   LET g_sfdc_d2[l_ac].sfdc004_2_desc1 = g_rtn_fields[2]
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc004_2_desc
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc004_2_desc1

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfdc_d2[l_ac].sfdc012_2
   CALL ap_ref_array2(g_ref_fields,"SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite= '"||g_site||"' AND inaa001=? ","") RETURNING g_rtn_fields
   LET g_sfdc_d2[l_ac].sfdc012_2_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc012_2_desc

   IF NOT cl_null(g_sfdc_d2[l_ac].sfdc013_2) THEN
      IF cl_null(g_sfdc_d2[l_ac].sfdc012_2) THEN
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_sfdc_d2[l_ac].sfdc013_2
         CALL ap_ref_array2(g_ref_fields,"SELECT inab003 FROM inab_t WHERE inabent='"||g_enterprise||"' AND inabsite= '"||g_site||"' AND inab002=? ","") RETURNING g_rtn_fields
      ELSE
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_sfdc_d2[l_ac].sfdc012_2
         LET g_ref_fields[2] = g_sfdc_d2[l_ac].sfdc013_2
         CALL ap_ref_array2(g_ref_fields,"SELECT inab003 FROM inab_t WHERE inabent='"||g_enterprise||"' AND inabsite= '"||g_site||"' AND inab001=? AND inab002=? ","") RETURNING g_rtn_fields
      END IF
   END IF
   LET g_sfdc_d2[l_ac].sfdc013_2_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc013_2_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sfdc_d2[l_ac].sfdc015_2
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='"||g_acc||"' AND oocql002 = ? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_sfdc_d2[l_ac].sfdc015_2_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sfdc_d2[l_ac].sfdc015_2_desc
   
   IF NOT cl_null(g_sfdc_d2[l_ac].sfdc004_2) THEN
      SELECT imaf034 INTO g_sfdc_d2[l_ac].imaf034_2
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_sfdc_d2[l_ac].sfdc004_2 
      SELECT imae092 INTO g_sfdc_d2[l_ac].imae092_2
        FROM imae_t
       WHERE imaeent = g_enterprise
         AND imaesite = g_site
         AND imae001 = g_sfdc_d2[l_ac].sfdc004_2    
   END IF
END FUNCTION
################################################################################
# Descriptions...: 發料明細第二個單身參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt310_sfdd_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/26 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_sfdd_desc()
   SELECT imaal003,imaal004 
     INTO g_sfdc_d3[l_ac1].sfdd001_desc,g_sfdc_d3[l_ac1].sfdd001_desc1
     FROM imaal_t 
    WHERE imaalent = g_enterprise 
      AND imaal001 = g_sfdc_d3[l_ac1].sfdd001
      AND imaal002 = g_dlang
   DISPLAY BY NAME g_sfdc_d3[l_ac1].sfdd001_desc,g_sfdc_d3[l_ac1].sfdd001_desc1
   
   #161006-00018#13---mod---s
   CALL s_desc_get_stock_desc(g_site,g_sfdc_d3[l_ac1].sfdd003) RETURNING g_sfdc_d3[l_ac1].sfdd003_desc  
   #INITIALIZE g_ref_fields TO NULL
   #LET g_ref_fields[1] = g_sfdc_d3[l_ac1].sfdd003
   #CALL ap_ref_array2(g_ref_fields,"SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite= '"||g_site||"' AND inaa001=? ","") RETURNING g_rtn_fields
   #LET g_sfdc_d3[l_ac1].sfdd003_desc = g_rtn_fields[1]
   #161006-00018#13---mod---e
   DISPLAY BY NAME g_sfdc_d3[l_ac1].sfdd003_desc
   
   IF NOT cl_null(g_sfdc_d3[l_ac1].sfdd004) THEN
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_sfdc_d3[l_ac1].sfdd003
      LET g_ref_fields[2] = g_sfdc_d3[l_ac1].sfdd004
      CALL ap_ref_array2(g_ref_fields,"SELECT inab003 FROM inab_t WHERE inabent='"||g_enterprise||"' AND inabsite= '"||g_site||"' AND inab001=? AND inab002=? ","") RETURNING g_rtn_fields
      LET g_sfdc_d3[l_ac1].sfdd004_desc = g_rtn_fields[1]
   ELSE
      LET g_sfdc_d3[l_ac1].sfdd004_desc = ''
   END IF
   DISPLAY BY NAME g_sfdc_d3[l_ac1].sfdd004_desc
END FUNCTION
################################################################################
# Descriptions...: 保稅料件,發料前調撥值顯示
# Memo...........:
# Usage..........: CALL asrt310_imaf034_imae092()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/28 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_imaf034_imae092()
   IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
      SELECT imaf034 INTO g_sfdc_d[l_ac].imaf034
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_sfdc_d[l_ac].sfdc004 
      SELECT imae092 INTO g_sfdc_d[l_ac].imae092
        FROM imae_t
       WHERE imaeent = g_enterprise
         AND imaesite = g_site
         AND imae001 = g_sfdc_d[l_ac].sfdc004    
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查是否存在BOM資料中
# Memo...........:
# Usage..........: CALL asrt310_chk_sfdc004()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/03 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_sfdc004()
DEFINE l_srza007             LIKE srza_t.srza007
DEFINE l_n                   LIKE type_t.num5
DEFINE l_sql                 STRING

   LET g_errno = ""
   SELECT srza007 INTO l_srza007
     FROM srza_t
    WHERE srzaent = g_enterprise
      AND srzasite = g_site
      AND srza001 = g_sfda_m.sfda009
   IF l_srza007 = '1' THEN
      LET l_n = 0
      LET l_sql = " SELECT COUNT(*) ",
                  "   FROM (SELECT bmba001,bmba003 FROM (SELECT bmba001,bmba002,bmba003 ",
                  "                                        FROM bmba_t ",
                  "                                       WHERE bmbaent = '",g_enterprise,"' ",
                  "                                         AND bmbasite = '",g_site,"') ",
                  "     START WITH bmba001 ='",g_sfda_m.sfda006,"' ",
                  "            AND bmba002 ='",g_sfda_m.sfda007,"' ",
                  #"     CONNECT BY PRIOR bmba003 = bmba001 ",   #161006-00018#13 mark
                  "     CONNECT BY NOCYCLE PRIOR bmba003 = bmba001 ",   #161006-00018#13 add
                  "       ORDER BY bmba001)",
                  "  WHERE bmba003 = '",g_sfdc_d[l_ac].sfdc004,"' "
      PREPARE asrt310_sel_bom_pr FROM l_sql
      EXECUTE asrt310_sel_bom_pr INTO l_n            
      IF l_n = 0 THEN      
         LET g_errno = 'abm-00012'
      END IF         
   END IF
   IF l_srza007 = '2' THEN
      LET l_n = 0
      LET l_sql = " SELECT COUNT(*) ",
                  "   FROM (SELECT bmba001,bmba003 FROM (SELECT bmba001,bmba002,bmba003 ",
                  "                                        FROM bmba_t ",
                  "                                       WHERE bmbaent = '",g_enterprise,"' ",
                  "                                         AND bmbasite = '",g_site,"') ",
                  "     START WITH bmba001 ='",g_sfda_m.sfda006,"' ",
                  "            AND bmba002 ='",g_sfda_m.sfda007,"' ",
                  #"     CONNECT BY PRIOR bmba003 = bmba001 ",    #161006-00018#13 mark
                  "     CONNECT BY NOCYCLE PRIOR bmba003 = bmba001 ",   #161006-00018#13 add
                  "       ORDER BY bmba001)",
                  "  WHERE bmba003 = '",g_sfdc_d[l_ac].sfdc004,"' "
      PREPARE asrt310_sel_bom_pr1 FROM l_sql
      EXECUTE asrt310_sel_bom_pr1 INTO l_n            
      IF l_n = 0 THEN      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'abm-00012'
         LET g_errparam.extend = g_sfdc_d[l_ac].sfdc004
         LET g_errparam.popup = TRUE
         CALL cl_err()

      END IF         
   END IF
END FUNCTION
################################################################################
# Descriptions...: 料號為非保稅料時是否可以輸入保稅倉
# Memo...........:
# Usage..........: CALL asrt310_chk_sfdc012()
# Input parameter: 無
# Return code....: r_sys     處理方式1.拒絕2.警告3.允許    
# Date & Author..: 2013/12/03 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_sfdc012()
DEFINE r_sys          LIKE type_t.chr80
DEFINE l_imaf034      LIKE imaf_t.imaf034
DEFINE l_ooba002      LIKE ooba_t.ooba002
DEFINE l_n            LIKE type_t.num5
 
   LET l_ooba002 = ''
   LET g_errno= ""
   CALL s_aooi200_get_slip(g_sfda_m.sfdadocno) RETURNING l_success,l_ooba002
   CALL cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0031') RETURNING r_sys
   IF r_sys = '1' OR r_sys = '2' THEN  
      IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
         SELECT imaf034 INTO l_imaf034
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = g_site
            AND imaf001 = g_sfdc_d[l_ac].sfdc004   
         IF l_imaf034 = 'N' THEN
            LET l_n = 0
            SELECT COUNT(*) INTO l_n
              FROM inaa_t
             WHERE inaaent = g_enterprise
               AND inaasite = g_site
               AND inaa001 = g_sfdc_d[l_ac].sfdc012
               AND inaa015 = 'Y'
           IF l_n > 0 THEN
              LET g_errno = 'asr-00008'
           END IF
         END IF
      END IF
   END IF
   RETURN r_sys
END FUNCTION
################################################################################
# Descriptions...: 發料料號只允許存在取替代料或等於需求料號
# Memo...........:
# Usage..........: CALL asrt310_chk_sfdd001()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/03 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_sfdd001()
DEFINE l_n        LIKE type_t.num5

   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM bmea_t
    WHERE bmeaent = g_enterprise
      AND bmeasite = g_site
      AND bmea008 = g_sfdc_d3[l_ac1].sfdd001
      AND bmea001 = g_sfda_m.sfda006
      AND bmea002 = g_sfda_m.sfda007
      AND bmea003 = g_sfdc_d2[l_ac].sfdc004_2
   IF l_n = 0 AND (g_sfdc_d3[l_ac1].sfdd001 <> g_sfdc_d2[l_ac].sfdc004_2) THEN
      LET g_errno = 'asr-00009'
   END IF
END FUNCTION
################################################################################
# Descriptions...: #單身欄位必輸關閉設定
# Memo...........:
# Usage..........: CALL asrt310_set_no_required_b(p_cmd)
# Input parameter: p_cmd          操作類型是新增或修改
# Return code....: 無
# Date & Author..: 2013/12/04 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_set_no_required_b(p_cmd)
DEFINE p_cmd     LIKE type_t.chr1

   CALL cl_set_comp_required("sfdc010",FALSE)
END FUNCTION
################################################################################
# Descriptions...: #單身欄位必輸設定
# Memo...........:
# Usage..........: CALL asrt310_set_required_b(p_cmd)
# Input parameter: p_cmd          操作類型是新增或修改
# Return code....: 無
# Date & Author..: 2013/12/04 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_set_required_b(p_cmd)
DEFINE p_cmd        LIKE type_t.chr1
DEFINE l_imaf015    LIKE imaf_t.imaf015

   LET l_imaf015 = ""
   IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
      SELECT imaf015 INTO l_imaf015
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_sfdc_d[l_ac].sfdc004
   END IF   
   IF NOT cl_null(l_imaf015) THEN
      CALL cl_set_comp_required("sfdc010",TRUE)
   END IF
END FUNCTION
################################################################################
# Descriptions...: 生產計畫預設值
# Memo...........:
# Usage..........: CALL asrt310_def_sfda009()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_def_sfda009()
DEFINE l_n       LIKE type_t.num5

   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   LET l_n = 0
   SELECT COUNT(DISTINCT sraa001) INTO l_n
     FROM sraa_t
    WHERE sraaent = g_enterprise
      AND sraasite = g_site
      AND sraa002 = l_year
      AND sraa003 = l_month
      AND sraastus = 'Y'
  IF l_n = 1 THEN
     SELECT DISTINCT sraa001 INTO g_sfda_m.sfda009
       FROM sraa_t
      WHERE sraaent = g_enterprise
        AND sraasite = g_site
        AND sraa002 = l_year
        AND sraa003 = l_month
        AND sraastus = 'Y'        
  END IF
END FUNCTION
################################################################################
# Descriptions...: 根據單頭單據日期+生產計畫帶出BOM特性+特徵+生產控制組
# Memo...........:
# Usage..........: CALL asrt310_def_srab()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_def_srab()
DEFINE l_n          LIKE type_t.num5
DEFINE l_sraa000    LIKE sraa_t.sraa000

   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   IF NOT cl_null(g_sfda_m.sfda009) THEN 
      SELECT sraa000 INTO l_sraa000
        FROM sraa_t
       WHERE sraaent = g_enterprise
         AND sraasite = g_site
         AND sraa002 = l_year
         AND sraa003 = l_month
         AND sraa001 = g_sfda_m.sfda009
         AND sraastus = 'Y'
      LET l_n = 0
      SELECT COUNT(DISTINCT srab004) INTO l_n
        FROM srab_t
       WHERE srabent = g_enterprise
         AND srabsite = g_site
         AND srab002 = l_year
         AND srab003 = l_month
         AND srab001 = g_sfda_m.sfda009
         AND srab000 = l_sraa000
      IF l_n = 1 THEN
         SELECT DISTINCT srab004 INTO g_sfda_m.sfda006
           FROM srab_t
          WHERE srabent = g_enterprise
            AND srabsite = g_site
            AND srab002 = l_year
            AND srab003 = l_month 
            AND srab001 = g_sfda_m.sfda009
            AND srab000 = l_sraa000
         LET l_n = 0
         SELECT COUNT(DISTINCT srab005) INTO l_n
           FROM srab_t
          WHERE srabent = g_enterprise
            AND srabsite = g_site
            AND srab002 = l_year
            AND srab003 = l_month
            AND srab001 = g_sfda_m.sfda009
            AND srab004 = g_sfda_m.sfda006
            AND srab000 = l_sraa000
         IF l_n = 1 THEN
            SELECT DISTINCT srab005 INTO g_sfda_m.sfda007
              FROM srab_t
             WHERE srabent = g_enterprise
               AND srabsite = g_site
               AND srab002 = l_year
               AND srab003 = l_month
               AND srab001 = g_sfda_m.sfda009
               AND srab004 = g_sfda_m.sfda006
               AND srab000 = l_sraa000
         END IF
         LET l_n = 0
         SELECT COUNT(DISTINCT srab006) INTO l_n
           FROM srab_t
          WHERE srabent = g_enterprise
            AND srabsite = g_site
            AND srab002 = l_year
            AND srab003 = l_month
            AND srab001 = g_sfda_m.sfda009
            AND srab004 = g_sfda_m.sfda006
            AND srab000 = l_sraa000
         IF l_n = 1 THEN
            SELECT DISTINCT srab006 INTO g_sfda_m.sfda008
              FROM srab_t
             WHERE srabent = g_enterprise
               AND srabsite = g_site
               AND srab002 = l_year
               AND srab003 = l_month
               AND srab001 = g_sfda_m.sfda009
               AND srab004 = g_sfda_m.sfda006
               AND srab000 = l_sraa000
         END IF
      END IF
   END IF
END FUNCTION
################################################################################
# Descriptions...: 檢查BOM中是否有此作業編號
# Memo...........:
# Usage..........: CALL asrt310_chk_bmba008()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/11/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_bmba008()
DEFINE l_n       LIKE type_t.num5
   
   LET g_errno = ""
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM bmba_t
    WHERE bmbaent = g_enterprise
      AND bmbasite = g_site
      AND bmba008 = g_sfda_m.sfda011
   IF l_n = 0 THEN
      LET g_errno = 'abm-00012'
   END IF
END FUNCTION
################################################################################
# Descriptions...: 套数的检查
# Memo...........:
# Usage..........: CALL asrt310_chk_sfda013()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2014/03/12 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt310_chk_sfda013()
DEFINE l_srab010      LIKE srab_t.srab010
DEFINE l_sfda013_f    LIKE sfda_t.sfda013
DEFINE l_sfda013_t    LIKE sfda_t.sfda013
DEFINE l_def          LIKE sfda_t.sfda013
DEFINE l_srza006      LIKE srza_t.srza006

   LET g_errno = '' 
   IF cl_null(g_sfda_m.sfdadocdt) OR cl_null(g_sfda_m.sfda006) OR  cl_null(g_sfda_m.sfda009) THEN
      RETURN
   END IF
   LET l_year = YEAR(g_sfda_m.sfdadocdt)
   LET l_month = MONTH(g_sfda_m.sfdadocdt)
   
   IF cl_null(g_sfda_m.sfda007) THEN
      LET g_sfda_m.sfda007 = ' '
   END IF
   IF cl_null(g_sfda_m.sfda008) THEN
      LET g_sfda_m.sfda008 = ' '
   END IF
   #asrt300計劃量
   SELECT srab010 INTO l_srab010
     FROM sraa_t,srab_t
    WHERE sraaent = srabent
      AND sraasite = srabsite
      AND sraa000 = srab000
      AND sraa001 = srab001
      AND sraa002 = srab002
      AND sraa003 = srab003
      AND srabent = g_enterprise
      AND srabsite = g_site
      AND srab001 = g_sfda_m.sfda009
      AND srab002 = l_year
      AND srab003 = l_month
      AND srab004 = g_sfda_m.sfda006
      AND srab005 = g_sfda_m.sfda007
      AND srab006 = g_sfda_m.sfda008
      AND srab009 = g_sfda_m.sfdadocdt
      AND sraastus = 'Y'
   IF cl_null(l_srab010) THEN
      LET l_srab010 = 0
   END IF
   #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      #已發套數
      SELECT SUM(sfda013) INTO l_sfda013_f
        FROM sfda_t
       WHERE sfdaent = g_enterprise
         AND sfdadocdt = g_sfda_m.sfdadocdt
         AND sfda002 = '16'
         AND sfda006 = g_sfda_m.sfda006
         AND sfda007 = g_sfda_m.sfda007
         AND sfda008 = g_sfda_m.sfda008
         AND sfda009 = g_sfda_m.sfda009
         AND sfdastus = 'S'
   ELSE
      #已發套數
      SELECT SUM(sfda013) INTO l_sfda013_f
        FROM sfda_t
       WHERE sfdaent = g_enterprise
         AND sfdadocdt <= g_sfda_m.sfdadocdt
         AND sfda002 = '16'
         AND sfda006 = g_sfda_m.sfda006
         AND sfda007 = g_sfda_m.sfda007
         AND sfda008 = g_sfda_m.sfda008
         AND sfda009 = g_sfda_m.sfda009
         AND sfdastus = 'S'   
   END IF      
   IF cl_null(l_sfda013_f) THEN
      LET l_sfda013_f = 0
   END IF
   #已退套數
   SELECT SUM(sfda013) INTO l_sfda013_t
     FROM sfda_t
    WHERE sfdaent = g_enterprise
      AND sfdadocdt <= g_sfda_m.sfdadocdt
      AND sfda002 = '26'
      AND sfda006 = g_sfda_m.sfda006
      AND sfda007 = g_sfda_m.sfda007
      AND sfda008 = g_sfda_m.sfda008
      AND sfda009 = g_sfda_m.sfda009
      AND sfdastus = 'S'
   IF cl_null(l_sfda013_t) THEN
      LET l_sfda013_t = 0
   END IF
   #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      LET l_def = l_srab010 - l_sfda013_f + l_sfda013_t
   ELSE
      LET l_def = l_sfda013_f - l_sfda013_t
   END IF   
   
   #IF g_prog = 'asrt310' THEN        #160705-00042#10 160713 by sakura mark
   IF g_prog MATCHES 'asrt310' THEN   #160705-00042#10 160713 by sakura add
      #參數設置是否允許超過預設值
      SELECT srza006 INTO l_srza006
        FROM srza_t
       WHERE srzaent = g_enterprise
         AND srzasite = g_site
         AND srza001 = g_sfda_m.sfda009
      IF l_srza006 = '2' THEN
         IF g_sfda_m.sfda013 > l_def THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asr-00038'
            LET g_errparam.extend = g_sfda_m.sfda013
            LET g_errparam.popup = TRUE
            CALL cl_err()
    
         END IF
      END IF
      IF l_srza006 = '1' THEN
         IF g_sfda_m.sfda013 > l_def THEN
            LET g_errno =  'asr-00038'
         END IF
      END IF
   ELSE
      IF g_sfda_m.sfda013 > l_def THEN
         LET g_errno =  'asr-00068'
      END IF
   END IF
END FUNCTION

PRIVATE FUNCTION asrt310_sfdadocno_desc(p_flag,p_sfdadocno)
DEFINE p_flag      LIKE type_t.chr1
DEFINE p_sfdadocno LIKE sfda_t.sfdadocno
DEFINE l_ooba002   LIKE ooba_t.ooba002
DEFINE r_p_sfdadocno_desc LIKE type_t.chr80

   IF p_flag = '2' THEN  
      Call s_aooi200_get_slip(p_sfdadocno) returning g_success,l_ooba002
   ELSE
      LET l_ooba002 = p_sfdadocno   
   END IF   
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_ooba002
   CALL ap_ref_array2(g_ref_fields,"SELECT oobxl003 FROM oobxl_t WHERE oobxlent='"||g_enterprise||"' AND oobxl001=? AND oobxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_p_sfdadocno_desc = '', g_rtn_fields[1] , ''
   RETURN r_p_sfdadocno_desc
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
PRIVATE FUNCTION asrt310_ins_inao_2()
DEFINE  l_sql       STRING
#DEFINE  l_inao      RECORD LIKE inao_t.*  #161124-00048#21 mark
#161124-00048#21 add(s)
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
#161124-00048#21 add(e)
DEFINE  r_success   LIKE type_t.num5

   #先刪除實際資料
   CALL s_asrt310_update_inao('2','2',g_sfda_m.sfdadocno,g_sfdc_d[l_ac].sfdcseq,'') RETURNING l_success    #151009-xianghui 
   DELETE FROM inao_t 
    WHERE inaodocno = g_sfda_m.sfdadocno
      AND inaosite = g_site
      AND inaoseq = g_sfdc_d[l_ac].sfdcseq
      AND inao000 = '2'
      AND inaoent = g_enterprise  #160905-00007#15 by 08172
            
#   LET l_sql = "SELECT * FROM inao_t ",   #161124-00048#21 mark
   #161124-00048#21 add(s)
   LET l_sql = "SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,",
               "       inao004,inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,",
               "       inao020,inao021,inao022,inao023,inao024,inao025 FROM inao_t ",
   #161124-00048#21 add(e)
               " WHERE inaodocno = '",g_sfda_m.sfdadocno,"'",
               "   AND inaoseq = ",g_sfdc_d[l_ac].sfdcseq,
               "   AND inao000 = '1' "
               
   PREPARE aint302_inao_pre FROM l_sql
   DECLARE aint302_inao_ins CURSOR FOR aint302_inao_pre  
   
   LET r_success = TRUE
   FOREACH aint302_inao_ins INTO l_inao.*
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
   CALL s_asrt310_update_inao('2','1',l_inao.inaodocno,l_inao.inaoseq,l_inao.inaoseq1) RETURNING r_success   
   RETURN r_success
END FUNCTION

################################################################################
#检查料件编号是否走产品特征
################################################################################
PRIVATE FUNCTION asrt310_imaa005_exists()
DEFINE l_imaa005  LIKE imaa_t.imaa005

   IF NOT cl_null(g_sfdc_d[l_ac].sfdc004) THEN
      SELECT imaa005 INTO l_imaa005 FROM imaa_t
       WHERE imaaent = g_enterprise AND imaa001 =  g_sfdc_d[l_ac].sfdc004
      IF cl_null(l_imaa005) THEN
         RETURN FALSE
      END IF
   ELSE
      RETURN FALSE
   END IF
   RETURN TRUE
END FUNCTION

 
{</section>}
 
