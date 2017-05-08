#該程式未解開Section, 採用最新樣板產出!
{<section id="astr510_g01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:2(2016-06-18 14:39:59), PR版次:0002(2016-06-18 14:37:36)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000027
#+ Filename...: astr510_g01
#+ Description: ...
#+ Creator....: 06540(2016-01-25 16:23:22)
#+ Modifier...: 07142 -SD/PR- 07142
 
{</section>}
 
{<section id="astr510_g01.global" readonly="Y" >}
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
   stbaent LIKE stba_t.stbaent, 
   stbadocno LIKE stba_t.stbadocno, 
   stbaunit LIKE stba_t.stbaunit, 
   l_stbaunit LIKE type_t.chr100, 
   stbasite LIKE stba_t.stbasite, 
   stba008 LIKE stba_t.stba008, 
   l_stba003 LIKE type_t.chr100, 
   l_stba002 LIKE type_t.chr100, 
   l_stba013 LIKE type_t.chr100, 
   l_amount LIKE type_t.num20_6, 
   l_stbastus LIKE type_t.chr100, 
   stbbsite LIKE stbb_t.stbbsite, 
   l_stbbsite LIKE type_t.chr100, 
   stbbseq LIKE stbb_t.stbbseq, 
   stbb011 LIKE stbb_t.stbb011, 
   stbb001 LIKE stbb_t.stbb001, 
   stael_t_stael003 LIKE stael_t.stael003, 
   stbb009 LIKE stbb_t.stbb009, 
   stbb005 LIKE stbb_t.stbb005, 
   stbb006 LIKE stbb_t.stbb006, 
   stbb017 LIKE stbb_t.stbb017
END RECORD
 
PRIVATE TYPE sr2_r RECORD
   ooff013 LIKE ooff_t.ooff013
END RECORD
 
 
DEFINE tm RECORD
       wc STRING                   #where conditon
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
 
{<section id="astr510_g01.main" readonly="Y" >}
PUBLIC FUNCTION astr510_g01(p_arg1)
DEFINE  p_arg1 STRING                  #tm.wc  where conditon
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
   
   LET g_rep_code = "astr510_g01"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #主報表select子句準備
   CALL astr510_g01_sel_prep()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料存入array
   CALL astr510_g01_ins_data()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料印出
   CALL astr510_g01_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="astr510_g01.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astr510_g01_sel_prep()
   #add-point:sel_prep段define (客製用) name="sel_prep.define_customerization"
   
   #end add-point
   #add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
   
   #end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
   
   #add-point:sel_prep g_select name="sel_prep.g_select"
 
   #end add-point
   LET g_select = " SELECT stbaent,stbadocno,stbaunit,NULL,stbasite,stba008,NULL,NULL,NULL,NULL,NULL, 
       stbbsite,NULL,stbbseq,stbb011,stbb001,stael_t.stael003,stbb009,stbb005,stbb006,stbb017"
 
   #add-point:sel_prep g_from name="sel_prep.g_from"
              
   #end add-point
    LET g_from = " FROM stba_t,stbb_t,stael_t"
 
   #add-point:sel_prep g_where name="sel_prep.g_where"
 
   #end add-point
    LET g_where = " WHERE " ,tm.wc CLIPPED 
 
   #add-point:sel_prep g_order name="sel_prep.g_order"
 
   #end add-point
    LET g_order = " ORDER BY stbadocno"
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
#     LET g_order = " ORDER BY stbddocno,stevseq "
     
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("stba_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED ," ",g_order CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段 
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   LET g_sql = " SELECT stbaent,stbadocno,stbaunit,'',stbasite,stba008,stba003,stba002,stba013,'',
                        stbastus,stbbsite,'',stbbseq,stbb011,stbb001,stael003,stbb009,
                        stbb005,stbb006,stbb017 ",
               "   FROM stba_t,stbb_t ",
               "   LEFT JOIN stael_t ON staelent = stbbent AND stael001 = stbb001 AND stael002 = '",g_dlang,"'",
               "  WHERE stbaent = stbbent AND stbadocno = stbbdocno AND stba000 = 'astt510' AND ",tm.wc CLIPPED,
               "  GROUP BY stbaent,stbadocno,stbaunit,stbasite,stba008,stba003,stba002,stba013,
                           stbastus,stbbsite,stbbseq,stbb011,stbb001,stael003,
                           stbb009,stbb005,stbb006,stbb017",
               "  ORDER BY stbadocno,stbbseq "
   LET g_sql = cl_sql_add_mask(g_sql)
   #end add-point
   PREPARE astr510_g01_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET g_rep_success = 'N'    
   END IF
   DECLARE astr510_g01_curs CURSOR FOR astr510_g01_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="astr510_g01.ins_data" readonly="Y" >}
PRIVATE FUNCTION astr510_g01_ins_data()
#主報表record(用於select子句)
   DEFINE sr_s RECORD 
   stbaent LIKE stba_t.stbaent, 
   stbadocno LIKE stba_t.stbadocno, 
   stbaunit LIKE stba_t.stbaunit, 
   l_stbaunit LIKE type_t.chr100, 
   stbasite LIKE stba_t.stbasite, 
   stba008 LIKE stba_t.stba008, 
   l_stba003 LIKE type_t.chr100, 
   l_stba002 LIKE type_t.chr100, 
   l_stba013 LIKE type_t.chr100, 
   l_amount LIKE type_t.num20_6, 
   l_stbastus LIKE type_t.chr100, 
   stbbsite LIKE stbb_t.stbbsite, 
   l_stbbsite LIKE type_t.chr100, 
   stbbseq LIKE stbb_t.stbbseq, 
   stbb011 LIKE stbb_t.stbb011, 
   stbb001 LIKE stbb_t.stbb001, 
   stael_t_stael003 LIKE stael_t.stael003, 
   stbb009 LIKE stbb_t.stbb009, 
   stbb005 LIKE stbb_t.stbb005, 
   stbb006 LIKE stbb_t.stbb006, 
   stbb017 LIKE stbb_t.stbb017
 END RECORD
   DEFINE l_cnt           LIKE type_t.num10
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point   
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"
DEFINE  l_desc       LIKE type_t.chr100
DEFINE  l_gzcbl003   LIKE type_t.chr100
DEFINE  l_gysdesc    LIKE type_t.chr100
DEFINE  l_stbbsite   LIKE type_t.chr100
#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    
    #end add-point
 
    CALL sr.clear()                                  #rep sr
    LET l_cnt = 1
    FOREACH astr510_g01_curs INTO sr_s.*
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
      #門店名稱
       SELECT ooefl003 INTO sr_s.l_stbbsite  #帶出門店名稱
         FROM ooefl_t
        WHERE ooefl001 = sr_s.stbbsite
          AND ooeflent = g_enterprise
          AND ooefl002 = g_dlang
      
      #供应商
       SELECT pmaal003 INTO l_gysdesc
         FROM pmaal_t
        WHERE pmaalent = sr_s.stbaent
          AND pmaal001 = sr_s.l_stba002
          AND pmaal002 = g_dlang
          
      LET sr_s.l_stba002 = sr_s.l_stba002,'|',l_gysdesc  
      
      #状态码 lanjj 2016-01-21 add
        SELECT gzcbl004 INTO l_gzcbl003
          FROM gzcbl_t
         WHERE gzcbl001 = '13'
           AND gzcbl002 = sr_s.l_stbastus
           AND gzcbl003 = g_dlang
           
        LET sr_s.l_stbastus = sr_s.l_stbastus,'|',l_gzcbl003

      #经营方式 6013
        SELECT gzcbl004 INTO l_desc
          FROM gzcbl_t
         WHERE gzcbl001 = '6013'
           AND gzcbl002 = sr_s.l_stba003
           AND gzcbl003 = g_dlang
           
        LET sr_s.l_stba003 = sr_s.l_stba003,'|',l_desc
       
       
       
       #end add-point
 
       #add-point:ins_data段before_arr name="ins_data.before.save"
       
       #end add-point
 
       #set rep array value
       LET sr[l_cnt].stbaent = sr_s.stbaent
       LET sr[l_cnt].stbadocno = sr_s.stbadocno
       LET sr[l_cnt].stbaunit = sr_s.stbaunit
       LET sr[l_cnt].l_stbaunit = sr_s.l_stbaunit
       LET sr[l_cnt].stbasite = sr_s.stbasite
       LET sr[l_cnt].stba008 = sr_s.stba008
       LET sr[l_cnt].l_stba003 = sr_s.l_stba003
       LET sr[l_cnt].l_stba002 = sr_s.l_stba002
       LET sr[l_cnt].l_stba013 = sr_s.l_stba013
       LET sr[l_cnt].l_amount = sr_s.l_amount
       LET sr[l_cnt].l_stbastus = sr_s.l_stbastus
       LET sr[l_cnt].stbbsite = sr_s.stbbsite
       LET sr[l_cnt].l_stbbsite = sr_s.l_stbbsite
       LET sr[l_cnt].stbbseq = sr_s.stbbseq
       LET sr[l_cnt].stbb011 = sr_s.stbb011
       LET sr[l_cnt].stbb001 = sr_s.stbb001
       LET sr[l_cnt].stael_t_stael003 = sr_s.stael_t_stael003
       LET sr[l_cnt].stbb009 = sr_s.stbb009
       LET sr[l_cnt].stbb005 = sr_s.stbb005
       LET sr[l_cnt].stbb006 = sr_s.stbb006
       LET sr[l_cnt].stbb017 = sr_s.stbb017
 
 
       #add-point:ins_data段after_arr name="ins_data.after.save"
       
       #end add-point
       LET l_cnt = l_cnt + 1
    END FOREACH
    CALL sr.deleteElement(l_cnt)
 
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astr510_g01.rep_data" readonly="Y" >}
PRIVATE FUNCTION astr510_g01_rep_data()
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
          START REPORT astr510_g01_rep TO XML HANDLER handler
          FOR l_i = 1 TO sr.getLength()
             OUTPUT TO REPORT astr510_g01_rep(sr[l_i].*)
             #報表中斷列印時，顯示錯誤訊息
             IF fgl_report_getErrorStatus() THEN
                DISPLAY "FGL: STOPPING REPORT msg=\"",fgl_report_getErrorString(),"\""
                EXIT FOR
             END IF                  
          END FOR
          FINISH REPORT astr510_g01_rep
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
 
{<section id="astr510_g01.rep" readonly="Y" >}
PRIVATE REPORT astr510_g01_rep(sr1)
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
DEFINE l_sum        LIKE stbb_t.stbb009
DEFINE l_ooefl003   LIKE ooefl_t.ooefl003
DEFINE l_stfal004   LIKE stfal_t.stfal004
DEFINE l_ooefl006   LIKE ooefl_t.ooefl006  #2015-10-30 ADDED BY LANJJ
#end add-point
 
    #add-point:rep段ORDER_before name="rep.order.before"
    
    #end add-point
    ORDER  BY sr1.stbadocno,sr1.stbbseq
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
        BEFORE GROUP OF sr1.stbadocno
            #報表 d05 樣板自動產生(Version:6)
            CALL cl_gr_title_clear()  #清除title變數值 
            #add-point:rep.header  #公司資訊(不在公用變數內) name="rep.header"
           
             SELECT ooefl006 INTO l_ooefl006
               FROM ooefl_t 
              WHERE ooeflent = sr1.stbaent
                AND ooefl001 = (SELECT ooef017 
                                  FROM ooef_t 
                                 WHERE ooefent = sr1.stbaent AND ooef001 = g_site) 
                AND ooefl002 = g_dlang
            LET g_grPageHeader.title0101 = l_ooefl006
            #end add-point:rep.header 
            LET g_rep_docno = sr1.stbadocno
            CALL cl_gr_init_pageheader() #表頭資訊
            PRINTX g_grPageHeader.*
            PRINTX g_grPageFooter.*
            #add-point:rep.apr.signstr.before name="rep.apr.signstr.before"
                          
            #end add-point:rep.apr.signstr.before   
            LET g_doc_key = 'stbaent=' ,sr1.stbaent,'{+}stbadocno=' ,sr1.stbadocno         
            CALL cl_gr_init_apr(sr1.stbadocno)
            #add-point:rep.apr.signstr name="rep.apr.signstr"

          LET l_ooefl003=''
         SELECT ooefl003 INTO l_ooefl003  #帶出組織名稱
           FROM ooefl_t
          WHERE ooefl001 = sr1.stbaunit AND ooeflent = g_enterprise
            AND ooefl002 = g_dlang

             LET sr1.l_stbaunit = sr1.stbaunit ,'|',l_ooefl003              

         
         LET l_stfal004='' 
         SELECT mhael023 INTO l_stfal004  
           FROM mhael_t
          WHERE mhaelent = g_enterprise 
            AND mhaelsite = g_site
            AND mhael001 = sr1.l_stba013
            AND mhael022 = g_dlang
         
         LET sr1.l_stba013 = sr1.l_stba013 ,'|',l_stfal004        
         
         SELECT SUM(stbb009) INTO sr1.l_amount
           FROM stbb_t
          WHERE stbbent = g_enterprise
            AND stbbdocno = sr1.stbadocno
                     
            #end add-point:rep.apr.signstr
            PRINTX g_grSign.*
 
 
 
           #add-point:rep.b_group.stbadocno.before name="rep.b_group.stbadocno.before"
           
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub01.before name="rep.sub01.before"
           
           #end add-point:rep.sub01.before
 
           #add-point:rep.sub01.sql name="rep.sub01.sql"
           
           #end add-point:rep.sub01.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='2' AND ooff004=0 AND ooffent = '", 
                sr1.stbaent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbadocno CLIPPED ,"'"
 
           #add-point:rep.sub01.afsql name="rep.sub01.afsql"
           
           #end add-point:rep.sub01.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep01_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr510_g01_repcur01_cnt_pre FROM l_sub_sql
           EXECUTE astr510_g01_repcur01_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep01_show ="Y"
           END IF
           PRINTX l_subrep01_show
           START REPORT astr510_g01_subrep01
           DECLARE astr510_g01_repcur01 CURSOR FROM g_sql
           FOREACH astr510_g01_repcur01 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr510_g01_repcur01:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub01.foreach name="rep.sub01.foreach"
              
              #end add-point:rep.sub01.foreach
              OUTPUT TO REPORT astr510_g01_subrep01(sr2.*)
           END FOREACH
           FINISH REPORT astr510_g01_subrep01
           #add-point:rep.sub01.after name="rep.sub01.after"
           
           #end add-point:rep.sub01.after
 
 
 
           #add-point:rep.b_group.stbadocno.after name="rep.b_group.stbadocno.after"
           #LET sr1.l_amount = 0
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        BEFORE GROUP OF sr1.stbbseq
 
           #add-point:rep.b_group.stbbseq.before name="rep.b_group.stbbseq.before"
           
           #end add-point:
 
 
           #add-point:rep.b_group.stbbseq.after name="rep.b_group.stbbseq.after"
           
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
                sr1.stbaent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbadocno CLIPPED ,"'", " AND  ooff004 = ", 
                sr1.stbbseq CLIPPED ,""
 
           #add-point:rep.sub02.afsql name="rep.sub02.afsql"
           
           #end add-point:rep.sub02.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep02_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr510_g01_repcur02_cnt_pre FROM l_sub_sql
           EXECUTE astr510_g01_repcur02_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep02_show ="Y"
           END IF
           PRINTX l_subrep02_show
           START REPORT astr510_g01_subrep02
           DECLARE astr510_g01_repcur02 CURSOR FROM g_sql
           FOREACH astr510_g01_repcur02 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr510_g01_repcur02:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub02.foreach name="rep.sub02.foreach"
              
              #end add-point:rep.sub02.foreach
              OUTPUT TO REPORT astr510_g01_subrep02(sr2.*)
           END FOREACH
           FINISH REPORT astr510_g01_subrep02
           #add-point:rep.sub02.after name="rep.sub02.after"
           
           #end add-point:rep.sub02.after
 
 
 
          #add-point:rep.everyrow.beforerow name="rep.everyrow.beforerow"
          
          #end add-point:rep.everyrow.beforerow
            
          PRINTX sr1.*
 
          #add-point:rep.everyrow.afterrow name="rep.everyrow.afterrow"
          #LET sr1.l_amount = sr1.l_amount + sr1.stbb009
          #end add-point:rep.everyrow.afterrow
 
          #單身後備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub03.before name="rep.sub03.before"
           
           #end add-point:rep.sub03.before
 
           #add-point:rep.sub03.sql name="rep.sub03.sql"
           
           #end add-point:rep.sub03.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='1' AND ooffent = '", 
                sr1.stbaent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbadocno CLIPPED ,"'", " AND  ooff004 = ", 
                sr1.stbbseq CLIPPED ,""
 
           #add-point:rep.sub03.afsql name="rep.sub03.afsql"
           
           #end add-point:rep.sub03.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep03_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr510_g01_repcur03_cnt_pre FROM l_sub_sql
           EXECUTE astr510_g01_repcur03_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep03_show ="Y"
           END IF
           PRINTX l_subrep03_show
           START REPORT astr510_g01_subrep03
           DECLARE astr510_g01_repcur03 CURSOR FROM g_sql
           FOREACH astr510_g01_repcur03 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr510_g01_repcur03:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub03.foreach name="rep.sub03.foreach"
              
              #end add-point:rep.sub03.foreach
              OUTPUT TO REPORT astr510_g01_subrep03(sr2.*)
           END FOREACH
           FINISH REPORT astr510_g01_subrep03
           #add-point:rep.sub03.after name="rep.sub03.after"
           
           #end add-point:rep.sub03.after
 
 
 
          #add-point:rep.everyrow.after name="rep.everyrow.after"
          
          #end add-point:rep.everyrow.after        
 
          #讀取afterGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.stbadocno
 
           #add-point:rep.a_group.stbadocno.before name="rep.a_group.stbadocno.before"
           #PRINTX sr1.l_amount
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub04.before name="rep.sub04.before"
           
           #end add-point:rep.sub04.before
 
           #add-point:rep.sub04.sql name="rep.sub04.sql"
           
           #end add-point:rep.sub04.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='1' AND ooff004=0 AND ooffent = '", 
                sr1.stbaent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbadocno CLIPPED ,"'"
 
           #add-point:rep.sub04.afsql name="rep.sub04.afsql"
           
           #end add-point:rep.sub04.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep04_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr510_g01_repcur04_cnt_pre FROM l_sub_sql
           EXECUTE astr510_g01_repcur04_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep04_show ="Y"
           END IF
           PRINTX l_subrep04_show
           START REPORT astr510_g01_subrep04
           DECLARE astr510_g01_repcur04 CURSOR FROM g_sql
           FOREACH astr510_g01_repcur04 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr510_g01_repcur04:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub04.foreach name="rep.sub04.foreach"
              
              #end add-point:rep.sub04.foreach
              OUTPUT TO REPORT astr510_g01_subrep04(sr2.*)
           END FOREACH
           FINISH REPORT astr510_g01_subrep04
           #add-point:rep.sub04.after name="rep.sub04.after"
           
           #end add-point:rep.sub04.after
 
 
 
           #add-point:rep.a_group.stbadocno.after name="rep.a_group.stbadocno.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.stbbseq
 
           #add-point:rep.a_group.stbbseq.before name="rep.a_group.stbbseq.before"
           
           #end add-point:
 
 
           #add-point:rep.a_group.stbbseq.after name="rep.a_group.stbbseq.after"
           
           #end add-point:
 
 
 
       ON LAST ROW
            #add-point:rep.lastrow.before name="rep.lastrow.before"  
                    
            #end add-point :rep.lastrow.before
 
            #add-point:rep.lastrow.after name="rep.lastrow.after"
            
            #end add-point :rep.lastrow.after
END REPORT
 
{</section>}
 
{<section id="astr510_g01.subrep_str" readonly="Y" >}
#讀取子報表樣板
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT astr510_g01_subrep01(sr2)
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
PRIVATE REPORT astr510_g01_subrep02(sr2)
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
PRIVATE REPORT astr510_g01_subrep03(sr2)
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
PRIVATE REPORT astr510_g01_subrep04(sr2)
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
 
{<section id="astr510_g01.other_function" readonly="Y" >}

 
{</section>}
 
{<section id="astr510_g01.other_report" readonly="Y" >}

 
{</section>}
 
