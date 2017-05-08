#該程式未解開Section, 採用最新樣板產出!
{<section id="astr350_g01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:1(2016-03-25 15:19:00), PR版次:0001(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000024
#+ Filename...: astr350_g01
#+ Description: ...
#+ Creator....: 06540(2016-03-25 15:12:11)
#+ Modifier...: 06540 -SD/PR- 00000
 
{</section>}
 
{<section id="astr350_g01.global" readonly="Y" >}
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
   steu001 LIKE steu_t.steu001, 
   steu002 LIKE steu_t.steu002, 
   steu003 LIKE steu_t.steu003, 
   steu004 LIKE steu_t.steu004, 
   steu005 LIKE steu_t.steu005, 
   steu006 LIKE steu_t.steu006, 
   steu007 LIKE steu_t.steu007, 
   steu009 LIKE steu_t.steu009, 
   steu012 LIKE steu_t.steu012, 
   steudocno LIKE steu_t.steudocno, 
   steudocnt LIKE steu_t.steudocnt, 
   steuent LIKE steu_t.steuent, 
   steusite LIKE steu_t.steusite, 
   steustus LIKE steu_t.steustus, 
   l_steustus LIKE type_t.chr30, 
   steuunit LIKE steu_t.steuunit, 
   stev002 LIKE stev_t.stev002, 
   stev003 LIKE stev_t.stev003, 
   l_stev003 LIKE type_t.chr10, 
   stev004 LIKE stev_t.stev004, 
   stev005 LIKE stev_t.stev005, 
   stev006 LIKE stev_t.stev006, 
   stev007 LIKE stev_t.stev007, 
   stev013 LIKE stev_t.stev013, 
   stevseq LIKE stev_t.stevseq, 
   stevsite LIKE stev_t.stevsite, 
   mhael_t_mhael023 LIKE mhael_t.mhael023, 
   pmaal_t_pmaal004 LIKE pmaal_t.pmaal004, 
   ooefl_t_ooefl003 LIKE ooefl_t.ooefl003, 
   x_stael_t_stael003 LIKE stael_t.stael003, 
   steucrtid LIKE steu_t.steucrtid, 
   l_steucrtid LIKE type_t.chr30
END RECORD
 
PRIVATE TYPE sr2_r RECORD
   ooff013 LIKE ooff_t.ooff013
END RECORD
 
 
DEFINE tm RECORD
       wc STRING                   #where condition
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

#end add-point
 
{</section>}
 
{<section id="astr350_g01.main" readonly="Y" >}
PUBLIC FUNCTION astr350_g01(p_arg1)
DEFINE  p_arg1 STRING                  #tm.wc  where condition
#add-point:init段define (客製用) name="component_name.define_customerization"

#end add-point
#add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="component_name.define"

#end add-point
 
   LET tm.wc = p_arg1
 
   #add-point:報表元件參數準備 name="component.arg.prep"
   
   #end add-point
   #報表元件代號
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   ##報表元件執行期間是否有錯誤代碼
   LET g_rep_success = 'Y'   
   
   LET g_rep_code = "astr350_g01"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #主報表select子句準備
   CALL astr350_g01_sel_prep()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料存入array
   CALL astr350_g01_ins_data()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料印出
   CALL astr350_g01_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="astr350_g01.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astr350_g01_sel_prep()
   #add-point:sel_prep段define (客製用) name="sel_prep.define_customerization"
   
   #end add-point
   #add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
   
   #end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
   
   #add-point:sel_prep g_select name="sel_prep.g_select"
   LET g_select = " SELECT steu001,steu002,steu003,steu004,steu005,steu006,steu007,steu009,steu012,steudocno,steudocnt,steuent,steusite,
   steustus,'',steuunit,stev002,'',stev003,stev004,stev005,stev006,stev007,stev013,stevseq,stevsite,mhael023,pmaal004,ooefl003,stael003,steucrtid,''"   
   #lanjj modify 2016-02-15---add '',steucrtid,'' 
   
   #end add-point
   LET g_select = " SELECT steu001,steu002,steu003,steu004,steu005,steu006,steu007,steu009,steu012,steudocno, 
       steudocnt,steuent,steusite,steustus,NULL,steuunit,stev002,stev003,NULL,stev004,stev005,stev006, 
       stev007,stev013,stevseq,stevsite,( SELECT mhael023 FROM mhael_t WHERE mhael_t.mhaelent = steu_t.steuent AND mhael_t.mhael001 = steu_t.steu002 AND mhael_t.mhael022 = '" , 
       g_dlang,"'" ,"),( SELECT pmaal004 FROM pmaal_t WHERE pmaal_t.pmaalent = steu_t.steuent AND pmaal_t.pmaal001 = steu_t.steu003 AND pmaal_t.pmaal002 = '" , 
       g_dlang,"'" ,"),( SELECT ooefl003 FROM ooefl_t WHERE ooefl_t.ooeflent = steu_t.steuent AND ooefl_t.ooefl001 = steu_t.steusite AND ooefl_t.ooefl002 = '" , 
       g_dlang,"'" ,"),x.stael_t_stael003,steucrtid,NULL"
 
   #add-point:sel_prep g_from name="sel_prep.g_from"
  LET g_from = " FROM steu_t LEFT OUTER JOIN pmaal_t ON pmaal_t.pmaalent = steu_t.steuent AND pmaal_t.pmaal001 = steu_t.steu003 AND pmaal_t.pmaal002 = '" , g_dlang,"'" ,
               "             LEFT OUTER JOIN mhael_t ON mhael_t.mhaelent = steu_t.steuent AND mhael_t.mhael001 = steu_t.steu002 AND mhael_t.mhael022 = '" , g_dlang,"'" ,
               "             LEFT OUTER JOIN ooefl_t ON ooefl_t.ooeflent = steu_t.steuent AND ooefl_t.ooefl001 = steu_t.steusite AND ooefl_t.ooefl002 = '" ,g_dlang,"'" ,
               "             LEFT OUTER JOIN stev_t  ON stev_t.stevent = steu_t.steuent AND stev_t.stevdocno = steu_t.steudocno ",
               "             LEFT OUTER JOIN stael_t ON stael_t.staelent = stev_t.stevent AND stael_t.stael001 = stev_t.stev005 AND stael_t.stael002 = '" , g_dlang,"'" 
             
   #end add-point
    LET g_from = " FROM steu_t LEFT OUTER JOIN ( SELECT stev_t.*,( SELECT stael003 FROM stael_t WHERE stael_t.staelent = stev_t.stevent AND stael_t.stael001 = stev_t.stev005 AND stael_t.stael002 = '" , 
        g_dlang,"'" ,") stael_t_stael003 FROM stev_t ) x  ON steu_t.steuent = x.stevent AND steu_t.steudocno  
        = x.stevdocno"
 
   #add-point:sel_prep g_where name="sel_prep.g_where"
   
   #end add-point
    LET g_where = " WHERE " ,tm.wc CLIPPED 
 
   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
    LET g_order = " ORDER BY steudocno"
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("steu_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED ," ",g_order CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段 
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE astr350_g01_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET g_rep_success = 'N'    
   END IF
   DECLARE astr350_g01_curs CURSOR FOR astr350_g01_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="astr350_g01.ins_data" readonly="Y" >}
PRIVATE FUNCTION astr350_g01_ins_data()
#主報表record(用於select子句)
   DEFINE sr_s RECORD 
   steu001 LIKE steu_t.steu001, 
   steu002 LIKE steu_t.steu002, 
   steu003 LIKE steu_t.steu003, 
   steu004 LIKE steu_t.steu004, 
   steu005 LIKE steu_t.steu005, 
   steu006 LIKE steu_t.steu006, 
   steu007 LIKE steu_t.steu007, 
   steu009 LIKE steu_t.steu009, 
   steu012 LIKE steu_t.steu012, 
   steudocno LIKE steu_t.steudocno, 
   steudocnt LIKE steu_t.steudocnt, 
   steuent LIKE steu_t.steuent, 
   steusite LIKE steu_t.steusite, 
   steustus LIKE steu_t.steustus, 
   l_steustus LIKE type_t.chr30, 
   steuunit LIKE steu_t.steuunit, 
   stev002 LIKE stev_t.stev002, 
   stev003 LIKE stev_t.stev003, 
   l_stev003 LIKE type_t.chr10, 
   stev004 LIKE stev_t.stev004, 
   stev005 LIKE stev_t.stev005, 
   stev006 LIKE stev_t.stev006, 
   stev007 LIKE stev_t.stev007, 
   stev013 LIKE stev_t.stev013, 
   stevseq LIKE stev_t.stevseq, 
   stevsite LIKE stev_t.stevsite, 
   mhael_t_mhael023 LIKE mhael_t.mhael023, 
   pmaal_t_pmaal004 LIKE pmaal_t.pmaal004, 
   ooefl_t_ooefl003 LIKE ooefl_t.ooefl003, 
   x_stael_t_stael003 LIKE stael_t.stael003, 
   steucrtid LIKE steu_t.steucrtid, 
   l_steucrtid LIKE type_t.chr30
 END RECORD
   DEFINE l_cnt           LIKE type_t.num10
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point   
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"

#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    
    #end add-point
 
    CALL sr.clear()                                  #rep sr
    LET l_cnt = 1
    FOREACH astr350_g01_curs INTO sr_s.*
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
       #lanjj add 2016-02-15 s
       SELECT ooag011 INTO sr_s.l_steucrtid
         FROM ooag_t
        WHERE ooagent = g_enterprise 
          AND ooag001 = sr_s.steucrtid
       #lanjj add 2016-02-15 e
       LET sr_s.mhael_t_mhael023 = "| ",sr_s.mhael_t_mhael023
       LET sr_s.pmaal_t_pmaal004 = "| ",sr_s.pmaal_t_pmaal004
       LET sr_s.ooefl_t_ooefl003 = "| ",sr_s.ooefl_t_ooefl003
#       SELECT steustus INTO sr_s.steustus
#         FROM steu_t
#        WHERE steuent = enterprise
#          AND steudocno = sr_s.steudocno
#       LET sr_s.steustus = 
       #end add-point
 
       #add-point:ins_data段before_arr name="ins_data.before.save"
       
       #end add-point
 
       #set rep array value
       LET sr[l_cnt].steu001 = sr_s.steu001
       LET sr[l_cnt].steu002 = sr_s.steu002
       LET sr[l_cnt].steu003 = sr_s.steu003
       LET sr[l_cnt].steu004 = sr_s.steu004
       LET sr[l_cnt].steu005 = sr_s.steu005
       LET sr[l_cnt].steu006 = sr_s.steu006
       LET sr[l_cnt].steu007 = sr_s.steu007
       LET sr[l_cnt].steu009 = sr_s.steu009
       LET sr[l_cnt].steu012 = sr_s.steu012
       LET sr[l_cnt].steudocno = sr_s.steudocno
       LET sr[l_cnt].steudocnt = sr_s.steudocnt
       LET sr[l_cnt].steuent = sr_s.steuent
       LET sr[l_cnt].steusite = sr_s.steusite
       LET sr[l_cnt].steustus = sr_s.steustus
       LET sr[l_cnt].l_steustus = sr_s.l_steustus
       LET sr[l_cnt].steuunit = sr_s.steuunit
       LET sr[l_cnt].stev002 = sr_s.stev002
       LET sr[l_cnt].stev003 = sr_s.stev003
       LET sr[l_cnt].l_stev003 = sr_s.l_stev003
       LET sr[l_cnt].stev004 = sr_s.stev004
       LET sr[l_cnt].stev005 = sr_s.stev005
       LET sr[l_cnt].stev006 = sr_s.stev006
       LET sr[l_cnt].stev007 = sr_s.stev007
       LET sr[l_cnt].stev013 = sr_s.stev013
       LET sr[l_cnt].stevseq = sr_s.stevseq
       LET sr[l_cnt].stevsite = sr_s.stevsite
       LET sr[l_cnt].mhael_t_mhael023 = sr_s.mhael_t_mhael023
       LET sr[l_cnt].pmaal_t_pmaal004 = sr_s.pmaal_t_pmaal004
       LET sr[l_cnt].ooefl_t_ooefl003 = sr_s.ooefl_t_ooefl003
       LET sr[l_cnt].x_stael_t_stael003 = sr_s.x_stael_t_stael003
       LET sr[l_cnt].steucrtid = sr_s.steucrtid
       LET sr[l_cnt].l_steucrtid = sr_s.l_steucrtid
 
 
       #add-point:ins_data段after_arr name="ins_data.after.save"
       
       #end add-point
       LET l_cnt = l_cnt + 1
    END FOREACH
    CALL sr.deleteElement(l_cnt)
 
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astr350_g01.rep_data" readonly="Y" >}
PRIVATE FUNCTION astr350_g01_rep_data()
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
          START REPORT astr350_g01_rep TO XML HANDLER handler
          FOR l_i = 1 TO sr.getLength()
             OUTPUT TO REPORT astr350_g01_rep(sr[l_i].*)
             #報表中斷列印時，顯示錯誤訊息
             IF fgl_report_getErrorStatus() THEN
                DISPLAY "FGL: STOPPING REPORT msg=\"",fgl_report_getErrorString(),"\""
                EXIT FOR
             END IF                  
          END FOR
          FINISH REPORT astr350_g01_rep
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
 
{<section id="astr350_g01.rep" readonly="Y" >}
PRIVATE REPORT astr350_g01_rep(sr1)
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
DEFINE l_sum1           LIKE stev_t.stev013
DEFINE l_gzcbl004       LIKE gzcbl_t.gzcbl004
#end add-point
 
    #add-point:rep段ORDER_before name="rep.order.before"
    
    #end add-point
    ORDER  BY sr1.steudocno
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
        BEFORE GROUP OF sr1.steudocno
            #報表 d05 樣板自動產生(Version:6)
            CALL cl_gr_title_clear()  #清除title變數值 
            #add-point:rep.header  #公司資訊(不在公用變數內) name="rep.header"

          SELECT gzcbl004 INTO l_gzcbl004
              FROM gzcbl_t
             WHERE gzcbl001=13
               AND gzcbl003=g_dlang
               AND gzcbl002=(SELECT steustus
                               FROM steu_t
                              WHERE steuent=sr1.steuent 
                                AND steusite=sr1.steusite
                                AND steudocno=sr1.steudocno)           
            
       LET sr1.l_steustus = sr1.steustus,"|",l_gzcbl004
            #end add-point:rep.header 
            LET g_rep_docno = sr1.steudocno
            CALL cl_gr_init_pageheader() #表頭資訊
            PRINTX g_grPageHeader.*
            PRINTX g_grPageFooter.*
            #add-point:rep.apr.signstr.before name="rep.apr.signstr.before"
                          
            #end add-point:rep.apr.signstr.before   
            LET g_doc_key = 'steuent=' ,sr1.steuent,'{+}steudocno=' ,sr1.steudocno         
            CALL cl_gr_init_apr(sr1.steudocno)
            #add-point:rep.apr.signstr name="rep.apr.signstr"
                          
            #end add-point:rep.apr.signstr
            PRINTX g_grSign.*
 
 
 
           #add-point:rep.b_group.steudocno.before name="rep.b_group.steudocno.before"
           LET l_sum1 = 0
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub01.before name="rep.sub01.before"
           
           #end add-point:rep.sub01.before
 
           #add-point:rep.sub01.sql name="rep.sub01.sql"
           
           #end add-point:rep.sub01.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='2' AND ooff004=0 AND ooffent = '", 
                sr1.steuent CLIPPED ,"'", " AND  ooff003 = '", sr1.steudocno CLIPPED ,"'"
 
           #add-point:rep.sub01.afsql name="rep.sub01.afsql"
           
           #end add-point:rep.sub01.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep01_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr350_g01_repcur01_cnt_pre FROM l_sub_sql
           EXECUTE astr350_g01_repcur01_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep01_show ="Y"
           END IF
           PRINTX l_subrep01_show
           START REPORT astr350_g01_subrep01
           DECLARE astr350_g01_repcur01 CURSOR FROM g_sql
           FOREACH astr350_g01_repcur01 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr350_g01_repcur01:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub01.foreach name="rep.sub01.foreach"
              
              #end add-point:rep.sub01.foreach
              OUTPUT TO REPORT astr350_g01_subrep01(sr2.*)
           END FOREACH
           FINISH REPORT astr350_g01_subrep01
           #add-point:rep.sub01.after name="rep.sub01.after"
           
           #end add-point:rep.sub01.after
 
 
 
           #add-point:rep.b_group.steudocno.after name="rep.b_group.steudocno.after"
           
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
                sr1.steuent CLIPPED ,"'", " AND  ooff003 = '", sr1.steudocno CLIPPED ,"'"
 
           #add-point:rep.sub02.afsql name="rep.sub02.afsql"
           
           #end add-point:rep.sub02.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep02_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr350_g01_repcur02_cnt_pre FROM l_sub_sql
           EXECUTE astr350_g01_repcur02_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep02_show ="Y"
           END IF
           PRINTX l_subrep02_show
           START REPORT astr350_g01_subrep02
           DECLARE astr350_g01_repcur02 CURSOR FROM g_sql
           FOREACH astr350_g01_repcur02 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr350_g01_repcur02:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub02.foreach name="rep.sub02.foreach"
              
              #end add-point:rep.sub02.foreach
              OUTPUT TO REPORT astr350_g01_subrep02(sr2.*)
           END FOREACH
           FINISH REPORT astr350_g01_subrep02
           #add-point:rep.sub02.after name="rep.sub02.after"
           
           #end add-point:rep.sub02.after
 
 
 
          #add-point:rep.everyrow.beforerow name="rep.everyrow.beforerow"
          
          #end add-point:rep.everyrow.beforerow
            
          PRINTX sr1.*
 
          #add-point:rep.everyrow.afterrow name="rep.everyrow.afterrow"
           LET l_sum1=l_sum1+sr1.stev013
          #end add-point:rep.everyrow.afterrow
 
          #單身後備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub03.before name="rep.sub03.before"
           
           #end add-point:rep.sub03.before
 
           #add-point:rep.sub03.sql name="rep.sub03.sql"
           
           #end add-point:rep.sub03.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='1' AND ooff003 = '", 
                sr1.steuent CLIPPED ,"'"
 
           #add-point:rep.sub03.afsql name="rep.sub03.afsql"
           
           #end add-point:rep.sub03.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep03_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr350_g01_repcur03_cnt_pre FROM l_sub_sql
           EXECUTE astr350_g01_repcur03_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep03_show ="Y"
           END IF
           PRINTX l_subrep03_show
           START REPORT astr350_g01_subrep03
           DECLARE astr350_g01_repcur03 CURSOR FROM g_sql
           FOREACH astr350_g01_repcur03 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr350_g01_repcur03:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub03.foreach name="rep.sub03.foreach"
              
              #end add-point:rep.sub03.foreach
              OUTPUT TO REPORT astr350_g01_subrep03(sr2.*)
           END FOREACH
           FINISH REPORT astr350_g01_subrep03
           #add-point:rep.sub03.after name="rep.sub03.after"
           
           #end add-point:rep.sub03.after
 
 
 
          #add-point:rep.everyrow.after name="rep.everyrow.after"
          
          #end add-point:rep.everyrow.after        
 
          #讀取afterGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.steudocno
 
           #add-point:rep.a_group.steudocno.before name="rep.a_group.steudocno.before"
           PRINTX l_sum1
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub04.before name="rep.sub04.before"
           
           #end add-point:rep.sub04.before
 
           #add-point:rep.sub04.sql name="rep.sub04.sql"
           
           #end add-point:rep.sub04.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='1' AND ooff004=0 AND ooffent = '", 
                sr1.steuent CLIPPED ,"'", " AND  ooff003 = '", sr1.steudocno CLIPPED ,"'"
 
           #add-point:rep.sub04.afsql name="rep.sub04.afsql"
           
           #end add-point:rep.sub04.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep04_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr350_g01_repcur04_cnt_pre FROM l_sub_sql
           EXECUTE astr350_g01_repcur04_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep04_show ="Y"
           END IF
           PRINTX l_subrep04_show
           START REPORT astr350_g01_subrep04
           DECLARE astr350_g01_repcur04 CURSOR FROM g_sql
           FOREACH astr350_g01_repcur04 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr350_g01_repcur04:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub04.foreach name="rep.sub04.foreach"
              
              #end add-point:rep.sub04.foreach
              OUTPUT TO REPORT astr350_g01_subrep04(sr2.*)
           END FOREACH
           FINISH REPORT astr350_g01_subrep04
           #add-point:rep.sub04.after name="rep.sub04.after"
           
           #end add-point:rep.sub04.after
 
 
 
           #add-point:rep.a_group.steudocno.after name="rep.a_group.steudocno.after"
           
           #end add-point:
 
 
 
       ON LAST ROW
            #add-point:rep.lastrow.before name="rep.lastrow.before"  
                    
            #end add-point :rep.lastrow.before
 
            #add-point:rep.lastrow.after name="rep.lastrow.after"
            
            #end add-point :rep.lastrow.after
END REPORT
 
{</section>}
 
{<section id="astr350_g01.subrep_str" readonly="Y" >}
#讀取子報表樣板
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT astr350_g01_subrep01(sr2)
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
PRIVATE REPORT astr350_g01_subrep02(sr2)
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
PRIVATE REPORT astr350_g01_subrep03(sr2)
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
PRIVATE REPORT astr350_g01_subrep04(sr2)
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
 
{<section id="astr350_g01.other_function" readonly="Y" >}

 
{</section>}
 
{<section id="astr350_g01.other_report" readonly="Y" >}

 
{</section>}
 
