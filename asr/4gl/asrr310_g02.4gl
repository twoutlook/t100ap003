#該程式未解開Section, 採用最新樣板產出!
{<section id="asrr310_g02.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:1(2015-01-12 11:19:38), PR版次:0001(2015-04-16 17:18:05)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000057
#+ Filename...: asrr310_g02
#+ Description: ...
#+ Creator....: 05423(2015-01-12 10:51:36)
#+ Modifier...: 05423 -SD/PR- 05423
 
{</section>}
 
{<section id="asrr310_g02.global" readonly="Y" >}
#報表 g01 樣板自動產生(Version:13)
#add-point:填寫註解說明 name="global.memo"

#end add-point
#add-point:填寫註解說明 name="global.memo_customerization"

 
IMPORT os
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_report.inc"                  #報表使用的global
 
#報表 type 宣告
PRIVATE TYPE sr1_r RECORD
   sfdadocno LIKE sfda_t.sfdadocno, 
   sfdadocdt LIKE sfda_t.sfdadocdt, 
   sfda009 LIKE sfda_t.sfda009, 
   l_sfda009_desc LIKE type_t.chr30, 
   sfda006 LIKE sfda_t.sfda006, 
   l_imaal003_1 LIKE imaal_t.imaal003, 
   l_imaal004_1 LIKE imaal_t.imaal004, 
   sfda004 LIKE sfda_t.sfda004, 
   l_sfda004_desc LIKE type_t.chr30, 
   sfda003 LIKE sfda_t.sfda003, 
   l_sfda003_desc LIKE type_t.chr50, 
   sfda013 LIKE sfda_t.sfda013, 
   sfdaent LIKE sfda_t.sfdaent, 
   sfdcseq LIKE sfdc_t.sfdcseq, 
   sfdc004 LIKE sfdc_t.sfdc004, 
   l_imaal003 LIKE imaal_t.imaal003, 
   l_imaal004 LIKE imaal_t.imaal004, 
   sfdc005 LIKE sfdc_t.sfdc005, 
   l_sfdc005_show LIKE type_t.chr2, 
   l_sfde009 LIKE sfde_t.sfde009, 
   l_imae092 LIKE imae_t.imae092, 
   sfdc007 LIKE sfdc_t.sfdc007, 
   sfdc010 LIKE sfdc_t.sfdc010, 
   sfdc006 LIKE sfdc_t.sfdc006, 
   sfdc009 LIKE sfdc_t.sfdc009, 
   sfdc012 LIKE sfdc_t.sfdc012, 
   l_sfdc012_desc LIKE type_t.chr50, 
   sfdc013 LIKE sfdc_t.sfdc013, 
   l_sfdc013_desc LIKE type_t.chr50, 
   sfdc014 LIKE sfdc_t.sfdc014, 
   l_sfdc014_show LIKE type_t.chr2, 
   sfdc016 LIKE sfdc_t.sfdc016, 
   l_sfdc016_show LIKE type_t.chr2, 
   sfdc015 LIKE sfdc_t.sfdc015, 
   l_sfdc015_desc LIKE type_t.chr30, 
   sfdc008 LIKE sfdc_t.sfdc008, 
   sfdc011 LIKE sfdc_t.sfdc011, 
   l_sfdc008_show LIKE type_t.chr2, 
   l_sfdc012_show LIKE type_t.chr2, 
   l_sfdc015_show LIKE type_t.chr2
END RECORD
 
PRIVATE TYPE sr2_r RECORD
   ooff013 LIKE ooff_t.ooff013
END RECORD
 
 
DEFINE tm RECORD
       wc STRING,                  #where condition 
       pr1 LIKE type_t.chr2,         #l_pr1 
       pr2 LIKE type_t.chr2          #l_pr2
       END RECORD
DEFINE sr DYNAMIC ARRAY OF sr1_r                   #宣告sr為sr1_t資料結構的動態陣列
DEFINE g_select        STRING
DEFINE g_from          STRING
DEFINE g_where         STRING
DEFINE g_order         STRING
DEFINE g_sql           STRING                         #report_select_prep,REPORT段使用
 
#add-point:自定義環境變數(Global Variable)(客製用) name="global.variable_customerization"

#end add-point
#add-point:自定義環境變數(Global Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE sr3_r RECORD                          #子報表2變數
   inaoseq1 LIKE inao_t.inaoseq1,
   inao008  LIKE inao_t.inao008,
   inao009  LIKE inao_t.inao009,
   inao010  LIKE inao_t.inao010,
   inao012  LIKE inao_t.inao012
END RECORD

 TYPE sr4_r RECORD                          #子報表3變數
   sfddseq1 LIKE sfdd_t.sfddseq1,
   sfdd001  LIKE sfdd_t.sfdd001,
   imaal003 LIKE imaal_t.imaal003,
   imaal004 LIKE imaal_t.imaal004,
   sfdd013  LIKE sfdd_t.sfdd013,
   l_sfdd013_show LIKE type_t.chr2,
   sfdd007  LIKE sfdd_t.sfdd007,
   sfdd009  LIKE sfdd_t.sfdd009,
   sfdd006  LIKE sfdd_t.sfdd006,
   sfdd008  LIKE sfdd_t.sfdd008,
   sfdd003  LIKE sfdd_t.sfdd003,
   l_sfdd003_desc LIKE type_t.chr50,
   sfdd004  LIKE sfdd_t.sfdd004,
   l_sfdd004_desc LIKE type_t.chr50,
   sfdd005  LIKE sfdd_t.sfdd005,
   l_sfdd005_show LIKE type_t.chr2,
   sfdd010  LIKE sfdd_t.sfdd010,
   l_sfdd010_show LIKE type_t.chr2  
END RECORD
#end add-point
 
{</section>}
 
{<section id="asrr310_g02.main" readonly="Y" >}
PUBLIC FUNCTION asrr310_g02(p_arg1,p_arg2,p_arg3)
DEFINE  p_arg1 STRING                  #tm.wc  where condition 
DEFINE  p_arg2 LIKE type_t.chr2         #tm.pr1  l_pr1 
DEFINE  p_arg3 LIKE type_t.chr2         #tm.pr2  l_pr2
#add-point:init段define (客製用) name="component_name.define_customerization"

#end add-point
#add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="component_name.define"

#end add-point
 
   LET tm.wc = p_arg1
   LET tm.pr1 = p_arg2
   LET tm.pr2 = p_arg3
 
   #add-point:報表元件參數準備 name="component.arg.prep"
   
   #end add-point
   #報表元件代號
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   ##報表元件執行期間是否有錯誤代碼
   LET g_rep_success = 'Y'   
   
   LET g_rep_code = "asrr310_g02"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #主報表select子句準備
   CALL asrr310_g02_sel_prep()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料存入array
   CALL asrr310_g02_ins_data()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料印出
   CALL asrr310_g02_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="asrr310_g02.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asrr310_g02_sel_prep()
   #add-point:sel_prep段define (客製用) name="sel_prep.define_customerization"
   
   #end add-point
   #add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
   
   #end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
   
   #add-point:sel_prep g_select name="sel_prep.g_select"
   CASE tm.pr1
   WHEN '3'
      LET g_select = " SELECT DISTINCT sfdadocno,sfdadocdt,sfda009,(trim(sfda009)||'.'||trim(srza002)),sfda006,a.imaal003,a.imaal004,sfda004,(trim(sfda004)||'.'||trim(ooag011)),sfda003,(trim(sfda003)||'.'||trim(ooefl003)), 
          sfda013,sfdaent,sfdcseq,sfdc004,b.imaal003,b.imaal004,sfdc005,NULL,sfde009,imae092,sfdc007,sfdc010,sfdc006,sfdc009, 
          sfdc012,(trim(sfdc012)||'.'||trim(inayl003)),sfdc013,(trim(sfdc013)||'.'||trim(inab003)),sfdc014,NULL,sfdc016,NULL,sfdc015,(trim(sfdc015)||'.'||trim(oocql004)),sfdc008,sfdc011,'N','N','Y'" 
   WHEN '4'
      LET g_select = " SELECT DISTINCT sfdadocno,sfdadocdt,sfda009,(trim(sfda009)||'.'||trim(srza002)),sfda006,a.imaal003,a.imaal004,sfda004,(trim(sfda004)||'.'||trim(ooag011)),sfda003,(trim(sfda003)||'.'||trim(ooefl003)), 
          sfda013,sfdaent,sfdcseq,sfdc004,b.imaal003,b.imaal004,sfdc005,NULL,sfde009,imae092,sfdc007,sfdc010,sfdc006,sfdc009, 
          sfdc012,(trim(sfdc012)||'.'||trim(inayl003)),sfdc013,(trim(sfdc013)||'.'||trim(inab003)),sfdc014,NULL,sfdc016,NULL,sfdc015,(trim(sfdc015)||'.'||trim(oocql004)),sfdc008,sfdc011,'N','N','N'" 
   END CASE
#   #end add-point
#   LET g_select = " SELECT sfdadocno,sfdadocdt,sfda009,NULL,sfda006,NULL,NULL,sfda004,NULL,sfda003,NULL, 
#       sfda013,sfdaent,sfdcseq,sfdc004,NULL,NULL,sfdc005,NULL,NULL,NULL,sfdc007,sfdc010,sfdc006,sfdc009, 
#       sfdc012,NULL,sfdc013,NULL,sfdc014,NULL,sfdc016,NULL,sfdc015,NULL,sfdc008,sfdc011,NULL,NULL,NULL" 
#
# 
#   #add-point:sel_prep g_from name="sel_prep.g_from"
   LET g_from = " FROM sfda_t LEFT OUTER JOIN sfdc_t ON sfdadocno = sfdcdocno AND sfdaent = sfdcent AND sfdasite = sfdcsite ",
                 "             LEFT OUTER JOIN sfde_t ON sfdadocno = sfdedocno AND sfdaent = sfdeent AND sfdeseq = sfdcseq ",
                 "             LEFT OUTER JOIN srza_t ON sfda009 = srza001 AND sfdaent = srzaent AND sfdasite = srzasite ",
                 "             LEFT OUTER JOIN ooag_t ON sfda004 = ooag001 AND sfdaent = ooagent ",
                 "             LEFT OUTER JOIN imae_t ON sfdc004 = imae001 AND sfdcent = imaeent AND sfdcsite = imaesite ",
                 "             LEFT OUTER JOIN inab_t ON sfdc012 = inab001 AND sfdc013 = inab002 AND sfdcent = inabent AND sfdcsite = inabsite ",
                 "             LEFT OUTER JOIN imaal_t a ON sfda006 = a.imaal001 AND sfdaent = a.imaalent AND a.imaal002 = '",g_dlang,"' ",
                 "             LEFT OUTER JOIN imaal_t b ON sfdc004 = b.imaal001 AND sfdcent = b.imaalent AND b.imaal002 = '",g_dlang,"' ",
                 "             LEFT OUTER JOIN ooefl_t ON sfda003 = ooefl001 AND sfdaent = ooeflent AND ooefl002 = '",g_dlang,"' ",
                 "             LEFT OUTER JOIN inayl_t ON sfdc012 = inayl001 AND sfdcent = inaylent AND inayl002 = '",g_dlang,"' ",
                 "             LEFT OUTER JOIN oocql_t ON sfdc015 = oocql002 AND oocql001 = '226' AND sfdcent = oocqlent AND oocql003 = '",g_dlang,"' "
#   #end add-point
#    LET g_from = " FROM sfda_t,sfdc_t"
# 
#   #add-point:sel_prep g_where name="sel_prep.g_where"
   
   #end add-point
    LET g_where = " WHERE " ,tm.wc CLIPPED 
 
   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
    LET g_order = " ORDER BY sfdadocno,sfdcseq"
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("sfda_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED ," ",g_order CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段 
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE asrr310_g02_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET g_rep_success = 'N'    
   END IF
   DECLARE asrr310_g02_curs CURSOR FOR asrr310_g02_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="asrr310_g02.ins_data" readonly="Y" >}
PRIVATE FUNCTION asrr310_g02_ins_data()
#主報表record(用於select子句)
   DEFINE sr_s RECORD 
   sfdadocno LIKE sfda_t.sfdadocno, 
   sfdadocdt LIKE sfda_t.sfdadocdt, 
   sfda009 LIKE sfda_t.sfda009, 
   l_sfda009_desc LIKE type_t.chr30, 
   sfda006 LIKE sfda_t.sfda006, 
   l_imaal003_1 LIKE imaal_t.imaal003, 
   l_imaal004_1 LIKE imaal_t.imaal004, 
   sfda004 LIKE sfda_t.sfda004, 
   l_sfda004_desc LIKE type_t.chr30, 
   sfda003 LIKE sfda_t.sfda003, 
   l_sfda003_desc LIKE type_t.chr50, 
   sfda013 LIKE sfda_t.sfda013, 
   sfdaent LIKE sfda_t.sfdaent, 
   sfdcseq LIKE sfdc_t.sfdcseq, 
   sfdc004 LIKE sfdc_t.sfdc004, 
   l_imaal003 LIKE imaal_t.imaal003, 
   l_imaal004 LIKE imaal_t.imaal004, 
   sfdc005 LIKE sfdc_t.sfdc005, 
   l_sfdc005_show LIKE type_t.chr2, 
   l_sfde009 LIKE sfde_t.sfde009, 
   l_imae092 LIKE imae_t.imae092, 
   sfdc007 LIKE sfdc_t.sfdc007, 
   sfdc010 LIKE sfdc_t.sfdc010, 
   sfdc006 LIKE sfdc_t.sfdc006, 
   sfdc009 LIKE sfdc_t.sfdc009, 
   sfdc012 LIKE sfdc_t.sfdc012, 
   l_sfdc012_desc LIKE type_t.chr50, 
   sfdc013 LIKE sfdc_t.sfdc013, 
   l_sfdc013_desc LIKE type_t.chr50, 
   sfdc014 LIKE sfdc_t.sfdc014, 
   l_sfdc014_show LIKE type_t.chr2, 
   sfdc016 LIKE sfdc_t.sfdc016, 
   l_sfdc016_show LIKE type_t.chr2, 
   sfdc015 LIKE sfdc_t.sfdc015, 
   l_sfdc015_desc LIKE type_t.chr30, 
   sfdc008 LIKE sfdc_t.sfdc008, 
   sfdc011 LIKE sfdc_t.sfdc011, 
   l_sfdc008_show LIKE type_t.chr2, 
   l_sfdc012_show LIKE type_t.chr2, 
   l_sfdc015_show LIKE type_t.chr2
 END RECORD
   DEFINE l_cnt           LIKE type_t.num10
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point   
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"
DEFINE l_success  LIKE type_t.chr2

#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    
    #end add-point
 
    CALL sr.clear()                                  #rep sr
    LET l_cnt = 1
    FOREACH asrr310_g02_curs INTO sr_s.*
       IF STATUS THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = 'foreach:'
          LET g_errparam.code   = STATUS
          LET g_errparam.popup  = TRUE
          CALL cl_err()       
          LET g_rep_success = 'N'    
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段foreach name="ins_data.foreach"
       #生產計劃
       IF sr_s.l_sfda009_desc = '.' THEN
         LET sr_s.l_sfda009_desc = sr_s.sfda009
       END IF
       #申請人
       IF sr_s.l_sfda004_desc = '.' THEN
         LET sr_s.l_sfda004_desc = sr_s.sfda004
       END IF
       #製造部門
       IF sr_s.l_sfda003_desc = '.' THEN
         LET sr_s.l_sfda003_desc = sr_s.sfda003
       END IF
       #料件特征
       IF NOT cl_null(sr_s.sfdc005) THEN
         LET sr_s.l_sfdc005_show = 'Y'
         CALL s_feature_description(sr_s.sfdc004,sr_s.sfdc005) RETURNING l_success,sr_s.sfdc005
       ELSE 
         LET sr_s.l_sfdc005_show = 'N'
       END IF
       #指定庫位
       IF sr_s.l_sfdc012_desc = '.' THEN
         LET sr_s.l_sfdc012_desc = sr_s.sfdc012
       END IF
       #制定儲位
       IF sr_s.l_sfdc013_desc = '.' THEN
         LET sr_s.l_sfdc013_desc = sr_s.sfdc013
       END IF
       #理由碼
       IF sr_s.l_sfdc015_desc = '.' THEN
         LET sr_s.l_sfdc015_desc = sr_s.sfdc015
       END IF
       #批號
       IF NOT cl_null(sr_s.sfdc014) THEN
         LET sr_s.l_sfdc014_show = 'Y'
       ELSE
         LET sr_s.l_sfdc014_show = 'N'
       END IF
       #庫存管理特徴
       IF NOT cl_null(sr_s.sfdc016) THEN
         LET sr_s.l_sfdc016_show = 'Y'
       ELSE
         LET sr_s.l_sfdc016_show = 'N'
       END IF
       #end add-point
 
       #add-point:ins_data段before_arr name="ins_data.before.save"
       
       #end add-point
 
       #set rep array value
       LET sr[l_cnt].sfdadocno = sr_s.sfdadocno
       LET sr[l_cnt].sfdadocdt = sr_s.sfdadocdt
       LET sr[l_cnt].sfda009 = sr_s.sfda009
       LET sr[l_cnt].l_sfda009_desc = sr_s.l_sfda009_desc
       LET sr[l_cnt].sfda006 = sr_s.sfda006
       LET sr[l_cnt].l_imaal003_1 = sr_s.l_imaal003_1
       LET sr[l_cnt].l_imaal004_1 = sr_s.l_imaal004_1
       LET sr[l_cnt].sfda004 = sr_s.sfda004
       LET sr[l_cnt].l_sfda004_desc = sr_s.l_sfda004_desc
       LET sr[l_cnt].sfda003 = sr_s.sfda003
       LET sr[l_cnt].l_sfda003_desc = sr_s.l_sfda003_desc
       LET sr[l_cnt].sfda013 = sr_s.sfda013
       LET sr[l_cnt].sfdaent = sr_s.sfdaent
       LET sr[l_cnt].sfdcseq = sr_s.sfdcseq
       LET sr[l_cnt].sfdc004 = sr_s.sfdc004
       LET sr[l_cnt].l_imaal003 = sr_s.l_imaal003
       LET sr[l_cnt].l_imaal004 = sr_s.l_imaal004
       LET sr[l_cnt].sfdc005 = sr_s.sfdc005
       LET sr[l_cnt].l_sfdc005_show = sr_s.l_sfdc005_show
       LET sr[l_cnt].l_sfde009 = sr_s.l_sfde009
       LET sr[l_cnt].l_imae092 = sr_s.l_imae092
       LET sr[l_cnt].sfdc007 = sr_s.sfdc007
       LET sr[l_cnt].sfdc010 = sr_s.sfdc010
       LET sr[l_cnt].sfdc006 = sr_s.sfdc006
       LET sr[l_cnt].sfdc009 = sr_s.sfdc009
       LET sr[l_cnt].sfdc012 = sr_s.sfdc012
       LET sr[l_cnt].l_sfdc012_desc = sr_s.l_sfdc012_desc
       LET sr[l_cnt].sfdc013 = sr_s.sfdc013
       LET sr[l_cnt].l_sfdc013_desc = sr_s.l_sfdc013_desc
       LET sr[l_cnt].sfdc014 = sr_s.sfdc014
       LET sr[l_cnt].l_sfdc014_show = sr_s.l_sfdc014_show
       LET sr[l_cnt].sfdc016 = sr_s.sfdc016
       LET sr[l_cnt].l_sfdc016_show = sr_s.l_sfdc016_show
       LET sr[l_cnt].sfdc015 = sr_s.sfdc015
       LET sr[l_cnt].l_sfdc015_desc = sr_s.l_sfdc015_desc
       LET sr[l_cnt].sfdc008 = sr_s.sfdc008
       LET sr[l_cnt].sfdc011 = sr_s.sfdc011
       LET sr[l_cnt].l_sfdc008_show = sr_s.l_sfdc008_show
       LET sr[l_cnt].l_sfdc012_show = sr_s.l_sfdc012_show
       LET sr[l_cnt].l_sfdc015_show = sr_s.l_sfdc015_show
 
 
       #add-point:ins_data段after_arr name="ins_data.after.save"
       
       #end add-point
       LET l_cnt = l_cnt + 1
    END FOREACH
    CALL sr.deleteElement(l_cnt)
 
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrr310_g02.rep_data" readonly="Y" >}
PRIVATE FUNCTION asrr310_g02_rep_data()
   DEFINE HANDLER         om.SaxDocumentHandler
   DEFINE l_i             INTEGER
 
    #判斷是否有報表資料，若回彈出訊息視窗
    IF sr.getLength() = 0 THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = "adz-00285"
       LET g_errparam.extend = NULL
       LET g_errparam.popup  = FALSE
       LET g_errparam.replace[1] = ''
       CALL cl_err()  
       RETURN 
    END IF
    WHILE TRUE   
       #add-point:rep_data段印前 name="rep_data.before"
       
       #end add-point     
       LET handler = cl_gr_handler()
       IF handler IS NOT NULL THEN
          START REPORT asrr310_g02_rep TO XML HANDLER handler
          FOR l_i = 1 TO sr.getLength()
             OUTPUT TO REPORT asrr310_g02_rep(sr[l_i].*)
             #報表中斷列印時，顯示錯誤訊息
             IF fgl_report_getErrorStatus() THEN
                DISPLAY "FGL: STOPPING REPORT msg=\"",fgl_report_getErrorString(),"\""
                EXIT FOR
             END IF                  
          END FOR
          FINISH REPORT asrr310_g02_rep
       END IF
       #add-point:rep_data段印完 name="rep_data.after"
       
       #end add-point       
       IF g_rep_flag = TRUE THEN
          LET g_rep_flag = FALSE
          EXIT WHILE
       END IF
    END WHILE
    #add-point:rep_data段離開while印完前 name="rep_data.end.before"
    
    #end add-point
    CALL cl_gr_close_report()
    #add-point:rep_data段離開while印完後 name="rep_data.end.after"
    
    #end add-point    
END FUNCTION
 
{</section>}
 
{<section id="asrr310_g02.rep" readonly="Y" >}
PRIVATE REPORT asrr310_g02_rep(sr1)
DEFINE sr1 sr1_r
DEFINE sr2 sr2_r
DEFINE l_subrep01_show  LIKE type_t.chr1,
       l_subrep02_show  LIKE type_t.chr1,
       l_subrep03_show  LIKE type_t.chr1,
       l_subrep04_show  LIKE type_t.chr1
DEFINE l_cnt           LIKE type_t.num10
DEFINE l_sub_sql       STRING
#add-point:rep段define  (客製用) name="rep.define_customerization"

#end add-point
#add-point:rep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="rep.define"
DEFINE sr3 sr3_r
DEFINE sr4 sr4_r

DEFINE l_subrep05_show  LIKE type_t.chr1,
       l_subrep06_show  LIKE type_t.chr1
#end add-point
 
    #add-point:rep段ORDER_before name="rep.order.before"
    
    #end add-point
    ORDER EXTERNAL BY sr1.sfdadocno,sr1.sfdcseq
    #add-point:rep段ORDER_after name="rep.order.after"
    
    #end add-point
    
    FORMAT
       FIRST PAGE HEADER          
          PRINTX g_user,g_pdate,g_rep_code,g_company,g_ptime,g_user_name,g_date_fmt
          PRINTX tm.*
          PRINTX g_grNumFmt.*
          PRINTX g_rep_wcchp
 
          #讀取beforeGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        BEFORE GROUP OF sr1.sfdadocno
            #報表 d05 樣板自動產生(Version:6)
            CALL cl_gr_title_clear()  #清除title變數值 
            #add-point:rep.header  #公司資訊(不在公用變數內) name="rep.header"
            
            #end add-point:rep.header 
            LET g_rep_docno = sr1.sfdadocno
            CALL cl_gr_init_pageheader() #表頭資訊
            PRINTX g_grPageHeader.*
            PRINTX g_grPageFooter.*
            #add-point:rep.apr.signstr.before name="rep.apr.signstr.before"
                          
            #end add-point:rep.apr.signstr.before   
            LET g_doc_key = 'sfdaent=' ,sr1.sfdaent,'{+}sfdadocno=' ,sr1.sfdadocno         
            CALL cl_gr_init_apr(sr1.sfdadocno)
            #add-point:rep.apr.signstr name="rep.apr.signstr"
                          
            #end add-point:rep.apr.signstr
            PRINTX g_grSign.*
 
 
 
           #add-point:rep.b_group.sfdadocno.before name="rep.b_group.sfdadocno.before"
           
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub01.before name="rep.sub01.before"
           
           #end add-point:rep.sub01.before
 
           #add-point:rep.sub01.sql name="rep.sub01.sql"
           
           #end add-point:rep.sub01.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='2' AND ooff004=0 AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'"
 
           #add-point:rep.sub01.afsql name="rep.sub01.afsql"
           
           #end add-point:rep.sub01.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep01_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asrr310_g02_repcur01_cnt_pre FROM l_sub_sql
           EXECUTE asrr310_g02_repcur01_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep01_show ="Y"
           END IF
           PRINTX l_subrep01_show
           START REPORT asrr310_g02_subrep01
           DECLARE asrr310_g02_repcur01 CURSOR FROM g_sql
           FOREACH asrr310_g02_repcur01 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asrr310_g02_repcur01:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub01.foreach name="rep.sub01.foreach"
              
              #end add-point:rep.sub01.foreach
              OUTPUT TO REPORT asrr310_g02_subrep01(sr2.*)
           END FOREACH
           FINISH REPORT asrr310_g02_subrep01
           #add-point:rep.sub01.after name="rep.sub01.after"
           
           #end add-point:rep.sub01.after
 
 
 
           #add-point:rep.b_group.sfdadocno.after name="rep.b_group.sfdadocno.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        BEFORE GROUP OF sr1.sfdcseq
 
           #add-point:rep.b_group.sfdcseq.before name="rep.b_group.sfdcseq.before"
           
           #end add-point:
 
 
           #add-point:rep.b_group.sfdcseq.after name="rep.b_group.sfdcseq.after"
           
           #end add-point:
 
 
 
 
       ON EVERY ROW
          #add-point:rep.everyrow.before name="rep.everyrow.before"
          
          #end add-point:rep.everyrow.before
 
          #單身前備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub02.before name="rep.sub02.before"
           
           #end add-point:rep.sub02.before
 
           #add-point:rep.sub02.sql name="rep.sub02.sql"
           
           #end add-point:rep.sub02.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='2' AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'", " AND  ooff004 = ", 
                sr1.sfdcseq CLIPPED ,""
 
           #add-point:rep.sub02.afsql name="rep.sub02.afsql"
           
           #end add-point:rep.sub02.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep02_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asrr310_g02_repcur02_cnt_pre FROM l_sub_sql
           EXECUTE asrr310_g02_repcur02_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep02_show ="Y"
           END IF
           PRINTX l_subrep02_show
           START REPORT asrr310_g02_subrep02
           DECLARE asrr310_g02_repcur02 CURSOR FROM g_sql
           FOREACH asrr310_g02_repcur02 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asrr310_g02_repcur02:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub02.foreach name="rep.sub02.foreach"
              
              #end add-point:rep.sub02.foreach
              OUTPUT TO REPORT asrr310_g02_subrep02(sr2.*)
           END FOREACH
           FINISH REPORT asrr310_g02_subrep02
           #add-point:rep.sub02.after name="rep.sub02.after"
           
           #end add-point:rep.sub02.after
 
 
 
          #add-point:rep.everyrow.beforerow name="rep.everyrow.beforerow"
          
          #end add-point:rep.everyrow.beforerow
            
          PRINTX sr1.*
 
          #add-point:rep.everyrow.afterrow name="rep.everyrow.afterrow"
          
          #子報表二
          LET g_sql = " SELECT DISTINCT inaoseq1,inao008,inao009,inao010,inao012 ",
                      " FROM inao_t ",
                      " WHERE inaodocno = '",sr1.sfdadocno CLIPPED,"' ",
                      "   AND inaoent = '",sr1.sfdaent CLIPPED,"' ",
                      "   AND inaoseq = '",sr1.sfdcseq CLIPPED,"' ",
                      " ORDER BY inaoseq1 "
          
          LET l_cnt = 0
          LET l_sub_sql = ""
          LET l_subrep05_show ="N"
          LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
          PREPARE asrr310_g02_repcur05_cnt_pre FROM l_sub_sql
          EXECUTE asrr310_g02_repcur05_cnt_pre INTO l_cnt
          IF l_cnt > 0 AND (tm.pr1 = '3' OR tm.pr1 = '4') THEN 
             LET l_subrep05_show ="Y"
          END IF
          PRINTX l_subrep05_show
          START REPORT asrr310_g02_subrep05
          DECLARE asrr310_g02_repcur05 CURSOR FROM g_sql
          FOREACH asrr310_g02_repcur05 INTO sr3.*
             IF STATUS THEN 
                INITIALIZE g_errparam TO NULL
                LET g_errparam.extend = "asrr310_g02_repcur05:"
                LET g_errparam.code   = SQLCA.sqlcode
                LET g_errparam.popup  = FALSE
                CALL cl_err()                  
                EXIT FOREACH 
             END IF
             #add-point:rep.sub05.foreach
             
             #end add-point:rep.sub05.foreach
             OUTPUT TO REPORT asrr310_g02_subrep05(sr3.*)
             END FOREACH
          FINISH REPORT asrr310_g02_subrep05
          
          #子報表三
          LET g_sql = " SELECT DISTINCT sfddseq1,sfdd001,imaal003,imaal004,sfdd013,'N',sfdd007,sfdd009,sfdd006,sfdd008,sfdd003,(trim(sfdd003)||'.'||trim(inayl003)),",
                      " sfdd004,(trim(sfdd004)||'.'||trim(inab003)),sfdd005,'N',sfdd010,'N' ",
                      " FROM sfdd_t LEFT OUTER JOIN inayl_t ON sfdd003 = inayl001 AND sfddent = inaylent AND inayl002 = '",g_dlang,"' ",
                      "             LEFT OUTER JOIN inab_t ON sfdd003 = inab001 AND sfdd004 = inab002 AND sfddent = inabent ",
                      "             LEFT OUTER JOIN imaal_t ON sfdd001 = imaal001 AND sfddent = imaalent AND imaal002 = '",g_dlang,"' ",
                      " WHERE sfdddocno = '",sr1.sfdadocno CLIPPED,"' ",
                      "   AND sfddent = '",sr1.sfdaent CLIPPED,"' ",
                      "   AND sfddseq = '",sr1.sfdcseq CLIPPED,"' ",
                      " ORDER BY sfddseq1 "
          
          LET l_cnt = 0
          LET l_sub_sql = ""
          LET l_subrep06_show ="N"
          LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
          PREPARE asrr310_g02_repcur06_cnt_pre FROM l_sub_sql
          EXECUTE asrr310_g02_repcur06_cnt_pre INTO l_cnt
          IF l_cnt > 0 AND (tm.pr1 = '3' OR tm.pr1 = '4') AND tm.pr2 = 'Y' THEN 
             LET l_subrep06_show ="Y"
          END IF
          PRINTX l_subrep06_show
          START REPORT asrr310_g02_subrep06
          DECLARE asrr310_g02_repcur06 CURSOR FROM g_sql
          FOREACH asrr310_g02_repcur06 INTO sr4.*
             IF STATUS THEN 
                INITIALIZE g_errparam TO NULL
                LET g_errparam.extend = "asrr310_g02_repcur06:"
                LET g_errparam.code   = SQLCA.sqlcode
                LET g_errparam.popup  = FALSE
                CALL cl_err()                  
                EXIT FOREACH 
             END IF
             #add-point:rep.sub06.foreach
             IF sr4.l_sfdd003_desc = '.' THEN
               LET sr4.l_sfdd003_desc = NULL
             END IF
             IF sr4.l_sfdd004_desc = '.' THEN
               LET sr4.l_sfdd004_desc = NULL
             END IF
             IF NOT cl_null(sr4.sfdd013) THEN
               LET sr4.l_sfdd013_show = 'Y'
             END IF
             IF NOT cl_null(sr4.sfdd005) THEN
               LET sr4.l_sfdd005_show = 'Y'
             END IF
             IF NOT cl_null(sr4.sfdd010) THEN
               LET sr4.l_sfdd010_show = 'Y'
             END IF
             #end add-point:rep.sub06.foreach
             OUTPUT TO REPORT asrr310_g02_subrep06(sr4.*)
             END FOREACH
          FINISH REPORT asrr310_g02_subrep06
          #end add-point:rep.everyrow.afterrow
 
          #單身後備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub03.before name="rep.sub03.before"
           
           #end add-point:rep.sub03.before
 
           #add-point:rep.sub03.sql name="rep.sub03.sql"
           
           #end add-point:rep.sub03.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='1' AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'", " AND  ooff004 = ", 
                sr1.sfdcseq CLIPPED ,""
 
           #add-point:rep.sub03.afsql name="rep.sub03.afsql"
           
           #end add-point:rep.sub03.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep03_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asrr310_g02_repcur03_cnt_pre FROM l_sub_sql
           EXECUTE asrr310_g02_repcur03_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep03_show ="Y"
           END IF
           PRINTX l_subrep03_show
           START REPORT asrr310_g02_subrep03
           DECLARE asrr310_g02_repcur03 CURSOR FROM g_sql
           FOREACH asrr310_g02_repcur03 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asrr310_g02_repcur03:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub03.foreach name="rep.sub03.foreach"
              
              #end add-point:rep.sub03.foreach
              OUTPUT TO REPORT asrr310_g02_subrep03(sr2.*)
           END FOREACH
           FINISH REPORT asrr310_g02_subrep03
           #add-point:rep.sub03.after name="rep.sub03.after"
           
           #end add-point:rep.sub03.after
 
 
 
          #add-point:rep.everyrow.after name="rep.everyrow.after"
          
          #end add-point:rep.everyrow.after        
 
          #讀取afterGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.sfdadocno
 
           #add-point:rep.a_group.sfdadocno.before name="rep.a_group.sfdadocno.before"
           
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub04.before name="rep.sub04.before"
           
           #end add-point:rep.sub04.before
 
           #add-point:rep.sub04.sql name="rep.sub04.sql"
           
           #end add-point:rep.sub04.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='1' AND ooff004=0 AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'"
 
           #add-point:rep.sub04.afsql name="rep.sub04.afsql"
           
           #end add-point:rep.sub04.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep04_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asrr310_g02_repcur04_cnt_pre FROM l_sub_sql
           EXECUTE asrr310_g02_repcur04_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep04_show ="Y"
           END IF
           PRINTX l_subrep04_show
           START REPORT asrr310_g02_subrep04
           DECLARE asrr310_g02_repcur04 CURSOR FROM g_sql
           FOREACH asrr310_g02_repcur04 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asrr310_g02_repcur04:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub04.foreach name="rep.sub04.foreach"
              
              #end add-point:rep.sub04.foreach
              OUTPUT TO REPORT asrr310_g02_subrep04(sr2.*)
           END FOREACH
           FINISH REPORT asrr310_g02_subrep04
           #add-point:rep.sub04.after name="rep.sub04.after"
           
           #end add-point:rep.sub04.after
 
 
 
           #add-point:rep.a_group.sfdadocno.after name="rep.a_group.sfdadocno.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.sfdcseq
 
           #add-point:rep.a_group.sfdcseq.before name="rep.a_group.sfdcseq.before"
           
           #end add-point:
 
 
           #add-point:rep.a_group.sfdcseq.after name="rep.a_group.sfdcseq.after"
           
           #end add-point:
 
 
 
       ON LAST ROW
            #add-point:rep.lastrow.before name="rep.lastrow.before"  
                    
            #end add-point :rep.lastrow.before
 
            #add-point:rep.lastrow.after name="rep.lastrow.after"
            
            #end add-point :rep.lastrow.after
END REPORT
 
{</section>}
 
{<section id="asrr310_g02.subrep_str" readonly="Y" >}
#讀取子報表樣板
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asrr310_g02_subrep01(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub01.define_customerization" 

#end add-point
#add-point:sub01.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub01.define" 

#end add-point:sub01.define
 
    #add-point:sub01.order.before name="sub01.order.before" 
    
    #end add-point:sub01.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub01.everyrow.before name="sub01.everyrow.before" 
                          
            #end add-point:sub01.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub01.everyrow.after name="sub01.everyrow.after" 
            
            #end add-point:sub01.everyrow.after
 
 
END REPORT
 
 
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asrr310_g02_subrep02(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub02.define_customerization" 

#end add-point
#add-point:sub02.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub02.define" 

#end add-point:sub02.define
 
    #add-point:sub02.order.before name="sub02.order.before" 
    
    #end add-point:sub02.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub02.everyrow.before name="sub02.everyrow.before" 
                          
            #end add-point:sub02.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub02.everyrow.after name="sub02.everyrow.after" 
            
            #end add-point:sub02.everyrow.after
 
 
END REPORT
 
 
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asrr310_g02_subrep03(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub03.define_customerization" 

#end add-point
#add-point:sub03.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub03.define" 

#end add-point:sub03.define
 
    #add-point:sub03.order.before name="sub03.order.before" 
    
    #end add-point:sub03.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub03.everyrow.before name="sub03.everyrow.before" 
                          
            #end add-point:sub03.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub03.everyrow.after name="sub03.everyrow.after" 
            
            #end add-point:sub03.everyrow.after
 
 
END REPORT
 
 
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asrr310_g02_subrep04(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub04.define_customerization" 

#end add-point
#add-point:sub04.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub04.define" 

#end add-point:sub04.define
 
    #add-point:sub04.order.before name="sub04.order.before" 
    
    #end add-point:sub04.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub04.everyrow.before name="sub04.everyrow.before" 
                          
            #end add-point:sub04.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub04.everyrow.after name="sub04.everyrow.after" 
            
            #end add-point:sub04.everyrow.after
 
 
END REPORT
 
 
 
 
{</section>}
 
{<section id="asrr310_g02.other_function" readonly="Y" >}

 
{</section>}
 
{<section id="asrr310_g02.other_report" readonly="Y" >}

PRIVATE REPORT asrr310_g02_subrep05(sr3)
   DEFINE sr3 sr3_r
   ORDER EXTERNAL BY sr3.inaoseq1
   FORMAT        
      ON EVERY ROW
         PRINTX g_grNumFmt.*
         PRINTX sr3.*
 
END REPORT

PRIVATE REPORT asrr310_g02_subrep06(sr4)
   DEFINE sr4 sr4_r
   ORDER EXTERNAL BY sr4.sfddseq1
   FORMAT        
      ON EVERY ROW
         PRINTX g_grNumFmt.*
         PRINTX sr4.*
         
END REPORT

 
{</section>}
 
