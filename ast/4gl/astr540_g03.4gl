#該程式未解開Section, 採用最新樣板產出!
{<section id="astr540_g03.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:2(2016-09-05 19:10:58), PR版次:0002(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000061
#+ Filename...: astr540_g03
#+ Description: ...
#+ Creator....: 06541(2015-09-10 11:11:44)
#+ Modifier...: 02599 -SD/PR- 00000
 
{</section>}
 
{<section id="astr540_g03.global" readonly="Y" >}
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
   stbddocno LIKE stbd_t.stbddocno, 
   stbd002 LIKE stbd_t.stbd002, 
   l_gysdesc LIKE type_t.chr300, 
   stbd037 LIKE stbd_t.stbd037, 
   l_stfal004 LIKE type_t.chr100, 
   stbdstus LIKE stbd_t.stbdstus, 
   stbdunit LIKE stbd_t.stbdunit, 
   stax_t_stax004 LIKE stax_t.stax004, 
   stev017 LIKE stev_t.stev017, 
   stbd025 LIKE stbd_t.stbd025, 
   stbd017 LIKE stbd_t.stbd017, 
   stbd018 LIKE stbd_t.stbd018, 
   stbdent LIKE stbd_t.stbdent, 
   stbd026 LIKE stbd_t.stbd026, 
   l_kp LIKE type_t.num15_3, 
   l_zje LIKE type_t.num15_3, 
   l_y LIKE type_t.num15_3, 
   l_n LIKE type_t.num15_3, 
   stevsite LIKE stev_t.stevsite, 
   stevseq LIKE stev_t.stevseq, 
   stev019 LIKE stev_t.stev019, 
   stev005 LIKE stev_t.stev005, 
   stael_t_stael003 LIKE stael_t.stael003, 
   stev016 LIKE stev_t.stev016, 
   stev026 LIKE stev_t.stev026, 
   stev030 LIKE stev_t.stev030, 
   stev027 LIKE stev_t.stev027, 
   l_desc LIKE type_t.chr100, 
   stbd021 LIKE stbd_t.stbd021, 
   l_stbd021 LIKE type_t.chr50, 
   stbd015 LIKE stbd_t.stbd015
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
 
{<section id="astr540_g03.main" readonly="Y" >}
PUBLIC FUNCTION astr540_g03(p_arg1)
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
   
   LET g_rep_code = "astr540_g03"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #主報表select子句準備
   CALL astr540_g03_sel_prep()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料存入array
   CALL astr540_g03_ins_data()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料印出
   CALL astr540_g03_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="astr540_g03.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astr540_g03_sel_prep()
   #add-point:sel_prep段define (客製用) name="sel_prep.define_customerization"
   
   #end add-point
   #add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
   
   #end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
   
   #add-point:sel_prep g_select name="sel_prep.g_select"
   LET g_select = " SELECT DISTINCT  stbddocno,stbd002,'',stbd037,'',stbdstus,stbdunit, 
                                     stfj004,stev017, stbd025,stbd017,stbd018,stbdent,stbd026,stbd045, 
                                     '','','' ,stevsite,stevseq ,stev019, 
                                     stev005,stael003,stev016,stev026,stev030,stev027,'',stbd021,ooag011,stbd015 "    #add by geza 20151008 stbd045
   
#   #end add-point
#   LET g_select = " SELECT stbddocno,stbd002,NULL,stbd037,NULL,stbdstus,stbdunit,stax_t.stax004,stev017, 
#       stbd025,stbd017,stbd018,stbdent,stbd026,NULL,NULL,NULL,NULL,stevsite,stevseq,stev019,stev005, 
#       stael_t.stael003,stev016,stev026,stev030,stev027,NULL,stbd021,NULL,stbd015"
# 
#   #add-point:sel_prep g_from name="sel_prep.g_from"

  LET g_from = " FROM stev_t",
       #        " LEFT  JOIN stev_t ON stevent=stbdent AND stevdocno = stbddocno  ",        
               " LEFT  JOIN stael_t ON staelent=stevent AND stev005 = stael001 AND stael002 ='",g_dlang,"' ",
               " ,stbd_t ",
        #       " LEFT  JOIN stax_t ON stbdent = staxent AND stax001 = stbd001 AND staxseq = stbd004 ",   #mark by dengdd 15/11/2
               " LEFT  JOIN stfj_t ON stbdent = stfjent AND stfj001 = stbd001 AND stfjseq = stbd004 ",
               " LEFT  JOIN ooag_t ON stbdent = ooagent AND stbd021 = ooag001 "  #add by dengdd 15/11/2
               
#   #end add-point
#    LET g_from = " FROM stbd_t,stev_t,stax_t,stael_t"
# 
#   #add-point:sel_prep g_where name="sel_prep.g_where"
 
#   #end add-point
#    LET g_where = " WHERE " ,tm.wc CLIPPED 
# 
#   #add-point:sel_prep g_order name="sel_prep.g_order"
    LET g_where = " WHERE stbd000 = '2'  AND stevent=stbdent AND stevdocno = stbddocno AND ",tm.wc CLIPPED
    #add by guomy 2016/1/19---限定540只可以打印联营资料--------
#   #end add-point
#    LET g_order = " ORDER BY stbddocno"
# 
#   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
     LET g_order = " ORDER BY stbddocno,stevseq "
     
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("stbd_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED ," ",g_order CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段 
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE astr540_g03_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET g_rep_success = 'N'    
   END IF
   DECLARE astr540_g03_curs CURSOR FOR astr540_g03_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="astr540_g03.ins_data" readonly="Y" >}
PRIVATE FUNCTION astr540_g03_ins_data()
#主報表record(用於select子句)
   DEFINE sr_s RECORD 
   stbddocno LIKE stbd_t.stbddocno, 
   stbd002 LIKE stbd_t.stbd002, 
   l_gysdesc LIKE type_t.chr300, 
   stbd037 LIKE stbd_t.stbd037, 
   l_stfal004 LIKE type_t.chr100, 
   stbdstus LIKE stbd_t.stbdstus, 
   stbdunit LIKE stbd_t.stbdunit, 
   stax_t_stax004 LIKE stax_t.stax004, 
   stev017 LIKE stev_t.stev017, 
   stbd025 LIKE stbd_t.stbd025, 
   stbd017 LIKE stbd_t.stbd017, 
   stbd018 LIKE stbd_t.stbd018, 
   stbdent LIKE stbd_t.stbdent, 
   stbd026 LIKE stbd_t.stbd026, 
   l_kp LIKE type_t.num15_3, 
   l_zje LIKE type_t.num15_3, 
   l_y LIKE type_t.num15_3, 
   l_n LIKE type_t.num15_3, 
   stevsite LIKE stev_t.stevsite, 
   stevseq LIKE stev_t.stevseq, 
   stev019 LIKE stev_t.stev019, 
   stev005 LIKE stev_t.stev005, 
   stael_t_stael003 LIKE stael_t.stael003, 
   stev016 LIKE stev_t.stev016, 
   stev026 LIKE stev_t.stev026, 
   stev030 LIKE stev_t.stev030, 
   stev027 LIKE stev_t.stev027, 
   l_desc LIKE type_t.chr100, 
   stbd021 LIKE stbd_t.stbd021, 
   l_stbd021 LIKE type_t.chr50, 
   stbd015 LIKE stbd_t.stbd015
 END RECORD
   DEFINE l_cnt           LIKE type_t.num10
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point   
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"
DEFINE  l_desc LIKE type_t.chr100
DEFINE l_gzcbl003  LIKE gzcbl_t.gzcbl003
#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    
    #end add-point
 
    CALL sr.clear()                                  #rep sr
    LET l_cnt = 1
    FOREACH astr540_g03_curs INTO sr_s.*
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
       #供应商
       SELECT pmaal003 INTO sr_s.l_gysdesc
         FROM pmaal_t
        WHERE pmaalent =sr_s.stbdent
          AND pmaal001 = sr_s.stbd002
          AND pmaal002 = g_dlang
          
      LET sr_s.l_gysdesc=sr_s.stbd002,'|',sr_s.l_gysdesc  #add by dengdd 15/11/2
      
      #状态码 lanjj 2016-01-21 add
        SELECT gzcbl004 INTO l_gzcbl003
          FROM gzcbl_t
         WHERE gzcbl001 = '13'
           AND gzcbl002 = sr_s.stbdstus
           AND gzcbl003 = g_dlang
           
        LET sr_s.stbdstus = sr_s.stbdstus,'|',l_gzcbl003

      #结算方式
       SELECT staal003 into l_desc 
         FROM staal_t 
        WHERE staal001=sr_s.stev017 
          AND staalent=sr_s.stbdent 
          AND staal002=g_dlang 
       IF NOT cl_null(l_desc) THEN 
         LET  sr_s.l_desc = sr_s.stev017,'|',l_desc
       END IF 
       
       
       
       #end add-point
 
       #add-point:ins_data段before_arr name="ins_data.before.save"
       
       #end add-point
 
       #set rep array value
       LET sr[l_cnt].stbddocno = sr_s.stbddocno
       LET sr[l_cnt].stbd002 = sr_s.stbd002
       LET sr[l_cnt].l_gysdesc = sr_s.l_gysdesc
       LET sr[l_cnt].stbd037 = sr_s.stbd037
       LET sr[l_cnt].l_stfal004 = sr_s.l_stfal004
       LET sr[l_cnt].stbdstus = sr_s.stbdstus
       LET sr[l_cnt].stbdunit = sr_s.stbdunit
       LET sr[l_cnt].stax_t_stax004 = sr_s.stax_t_stax004
       LET sr[l_cnt].stev017 = sr_s.stev017
       LET sr[l_cnt].stbd025 = sr_s.stbd025
       LET sr[l_cnt].stbd017 = sr_s.stbd017
       LET sr[l_cnt].stbd018 = sr_s.stbd018
       LET sr[l_cnt].stbdent = sr_s.stbdent
       LET sr[l_cnt].stbd026 = sr_s.stbd026
       LET sr[l_cnt].l_kp = sr_s.l_kp
       LET sr[l_cnt].l_zje = sr_s.l_zje
       LET sr[l_cnt].l_y = sr_s.l_y
       LET sr[l_cnt].l_n = sr_s.l_n
       LET sr[l_cnt].stevsite = sr_s.stevsite
       LET sr[l_cnt].stevseq = sr_s.stevseq
       LET sr[l_cnt].stev019 = sr_s.stev019
       LET sr[l_cnt].stev005 = sr_s.stev005
       LET sr[l_cnt].stael_t_stael003 = sr_s.stael_t_stael003
       LET sr[l_cnt].stev016 = sr_s.stev016
       LET sr[l_cnt].stev026 = sr_s.stev026
       LET sr[l_cnt].stev030 = sr_s.stev030
       LET sr[l_cnt].stev027 = sr_s.stev027
       LET sr[l_cnt].l_desc = sr_s.l_desc
       LET sr[l_cnt].stbd021 = sr_s.stbd021
       LET sr[l_cnt].l_stbd021 = sr_s.l_stbd021
       LET sr[l_cnt].stbd015 = sr_s.stbd015
 
 
       #add-point:ins_data段after_arr name="ins_data.after.save"
       
       #end add-point
       LET l_cnt = l_cnt + 1
    END FOREACH
    CALL sr.deleteElement(l_cnt)
 
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astr540_g03.rep_data" readonly="Y" >}
PRIVATE FUNCTION astr540_g03_rep_data()
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
          START REPORT astr540_g03_rep TO XML HANDLER handler
          FOR l_i = 1 TO sr.getLength()
             OUTPUT TO REPORT astr540_g03_rep(sr[l_i].*)
             #報表中斷列印時，顯示錯誤訊息
             IF fgl_report_getErrorStatus() THEN
                DISPLAY "FGL: STOPPING REPORT msg=\"",fgl_report_getErrorString(),"\""
                EXIT FOR
             END IF                  
          END FOR
          FINISH REPORT astr540_g03_rep
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
 
{<section id="astr540_g03.rep" readonly="Y" >}
PRIVATE REPORT astr540_g03_rep(sr1)
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
DEFINE l_sum1       LIKE stev_t.stev016
DEFINE l_ooefl003   LIKE ooefl_t.ooefl003
DEFINE l_stfal004   LIKE stfal_t.stfal004
DEFINE l_ooefl006  LIKE ooefl_t.ooefl006  #2015-10-30 ADDED BY LANJJ
#end add-point
 
    #add-point:rep段ORDER_before name="rep.order.before"
    
    #end add-point
    ORDER EXTERNAL BY sr1.stbddocno
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
        BEFORE GROUP OF sr1.stbddocno
            #報表 d05 樣板自動產生(Version:6)
            CALL cl_gr_title_clear()  #清除title變數值 
            #add-point:rep.header  #公司資訊(不在公用變數內) name="rep.header"
           
           #ADDED BY LANJJ 2015-10-30 ---S---
             SELECT ooefl006 INTO l_ooefl006
               FROM ooefl_t 
              WHERE ooeflent = sr1.stbdent
                AND ooefl001 = (SELECT ooef017 
                                  FROM ooef_t 
                                 WHERE ooefent = sr1.stbdent AND ooef001 = g_site) 
                AND ooefl002 = g_dlang
            LET g_grPageHeader.title0101 = l_ooefl006
           #ADDED BY LANJJ 2015-10-30 ---E---
          
            #end add-point:rep.header 
            LET g_rep_docno = sr1.stbddocno
            CALL cl_gr_init_pageheader() #表頭資訊
            PRINTX g_grPageHeader.*
            PRINTX g_grPageFooter.*
            #add-point:rep.apr.signstr.before name="rep.apr.signstr.before"
                          
            #end add-point:rep.apr.signstr.before   
            LET g_doc_key = 'stbdent=' ,sr1.stbdent,'{+}stbddocno=' ,sr1.stbddocno         
            CALL cl_gr_init_apr(sr1.stbddocno)
            #add-point:rep.apr.signstr name="rep.apr.signstr"

          LET l_ooefl003=''
         SELECT ooefl003 INTO l_ooefl003  #帶出組織名稱
           FROM ooefl_t
          WHERE ooefl001 = sr1.stbdunit AND ooeflent = g_enterprise
            AND ooefl002 = g_dlang
         
          IF cl_null(l_ooefl003) THEN
             LET l_ooefl003 = sr1.stbdunit
          ELSE 
             LET l_ooefl003= sr1.stbdunit ,'|',l_ooefl003              
          END IF
         
         LET l_stfal004='' 
         SELECT stfal004 INTO l_stfal004  
           FROM stfal_t
          WHERE stfal001 =(SELECT stbd001 
                             FROM stbd_t
                            WHERE stbdent =g_enterprise AND stbddocno=sr1.stbddocno )
            AND stfalent = g_enterprise
            AND stfal002 = g_dlang
         
          IF cl_null(l_stfal004) THEN
             LET l_stfal004 = sr1.stbd037
          ELSE 
             LET l_stfal004= sr1.stbd037 ,'|',l_stfal004 
          END IF          
          
            #end add-point:rep.apr.signstr
            PRINTX g_grSign.*
 
 
 
           #add-point:rep.b_group.stbddocno.before name="rep.b_group.stbddocno.before"
           LET l_sum1=0
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub01.before name="rep.sub01.before"
           
           #end add-point:rep.sub01.before
 
           #add-point:rep.sub01.sql name="rep.sub01.sql"
           
           #end add-point:rep.sub01.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='2' AND ooff004=0 AND ooffent = '", 
                sr1.stbdent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbddocno CLIPPED ,"'"
 
           #add-point:rep.sub01.afsql name="rep.sub01.afsql"
           
           #end add-point:rep.sub01.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep01_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr540_g03_repcur01_cnt_pre FROM l_sub_sql
           EXECUTE astr540_g03_repcur01_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep01_show ="Y"
           END IF
           PRINTX l_subrep01_show
           START REPORT astr540_g03_subrep01
           DECLARE astr540_g03_repcur01 CURSOR FROM g_sql
           FOREACH astr540_g03_repcur01 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr540_g03_repcur01:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub01.foreach name="rep.sub01.foreach"
              
              #end add-point:rep.sub01.foreach
              OUTPUT TO REPORT astr540_g03_subrep01(sr2.*)
           END FOREACH
           FINISH REPORT astr540_g03_subrep01
           #add-point:rep.sub01.after name="rep.sub01.after"
           
           #end add-point:rep.sub01.after
 
 
 
           #add-point:rep.b_group.stbddocno.after name="rep.b_group.stbddocno.after"
           
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
                sr1.stbdent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbddocno CLIPPED ,"'"
 
           #add-point:rep.sub02.afsql name="rep.sub02.afsql"
           
           #end add-point:rep.sub02.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep02_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr540_g03_repcur02_cnt_pre FROM l_sub_sql
           EXECUTE astr540_g03_repcur02_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep02_show ="Y"
           END IF
           PRINTX l_subrep02_show
           START REPORT astr540_g03_subrep02
           DECLARE astr540_g03_repcur02 CURSOR FROM g_sql
           FOREACH astr540_g03_repcur02 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr540_g03_repcur02:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub02.foreach name="rep.sub02.foreach"
              
              #end add-point:rep.sub02.foreach
              OUTPUT TO REPORT astr540_g03_subrep02(sr2.*)
           END FOREACH
           FINISH REPORT astr540_g03_subrep02
           #add-point:rep.sub02.after name="rep.sub02.after"
           
           #end add-point:rep.sub02.after
 
 
 
          #add-point:rep.everyrow.beforerow name="rep.everyrow.beforerow"
          
          #end add-point:rep.everyrow.beforerow
            
          PRINTX sr1.*
 
          #add-point:rep.everyrow.afterrow name="rep.everyrow.afterrow"
          LET l_sum1 = l_sum1 + sr1.stev016
          #end add-point:rep.everyrow.afterrow
 
          #單身後備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub03.before name="rep.sub03.before"
           
           #end add-point:rep.sub03.before
 
           #add-point:rep.sub03.sql name="rep.sub03.sql"
           
           #end add-point:rep.sub03.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='1' AND ooff003 = '", 
                sr1.stbdent CLIPPED ,"'"
 
           #add-point:rep.sub03.afsql name="rep.sub03.afsql"
           
           #end add-point:rep.sub03.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep03_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr540_g03_repcur03_cnt_pre FROM l_sub_sql
           EXECUTE astr540_g03_repcur03_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep03_show ="Y"
           END IF
           PRINTX l_subrep03_show
           START REPORT astr540_g03_subrep03
           DECLARE astr540_g03_repcur03 CURSOR FROM g_sql
           FOREACH astr540_g03_repcur03 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr540_g03_repcur03:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub03.foreach name="rep.sub03.foreach"
              
              #end add-point:rep.sub03.foreach
              OUTPUT TO REPORT astr540_g03_subrep03(sr2.*)
           END FOREACH
           FINISH REPORT astr540_g03_subrep03
           #add-point:rep.sub03.after name="rep.sub03.after"
           
           #end add-point:rep.sub03.after
 
 
 
          #add-point:rep.everyrow.after name="rep.everyrow.after"
          
          #end add-point:rep.everyrow.after        
 
          #讀取afterGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.stbddocno
 
           #add-point:rep.a_group.stbddocno.before name="rep.a_group.stbddocno.before"
           PRINTX l_sum1
           PRINTX l_ooefl003
           PRINTX l_stfal004  
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub04.before name="rep.sub04.before"
           
           #end add-point:rep.sub04.before
 
           #add-point:rep.sub04.sql name="rep.sub04.sql"
           
           #end add-point:rep.sub04.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='1' AND ooff004=0 AND ooffent = '", 
                sr1.stbdent CLIPPED ,"'", " AND  ooff003 = '", sr1.stbddocno CLIPPED ,"'"
 
           #add-point:rep.sub04.afsql name="rep.sub04.afsql"
           
           #end add-point:rep.sub04.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep04_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE astr540_g03_repcur04_cnt_pre FROM l_sub_sql
           EXECUTE astr540_g03_repcur04_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep04_show ="Y"
           END IF
           PRINTX l_subrep04_show
           START REPORT astr540_g03_subrep04
           DECLARE astr540_g03_repcur04 CURSOR FROM g_sql
           FOREACH astr540_g03_repcur04 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr540_g03_repcur04:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub04.foreach name="rep.sub04.foreach"
              
              #end add-point:rep.sub04.foreach
              OUTPUT TO REPORT astr540_g03_subrep04(sr2.*)
           END FOREACH
           FINISH REPORT astr540_g03_subrep04
           #add-point:rep.sub04.after name="rep.sub04.after"
           
           #end add-point:rep.sub04.after
 
 
 
           #add-point:rep.a_group.stbddocno.after name="rep.a_group.stbddocno.after"
           
           #end add-point:
 
 
 
       ON LAST ROW
            #add-point:rep.lastrow.before name="rep.lastrow.before"  
                    
            #end add-point :rep.lastrow.before
 
            #add-point:rep.lastrow.after name="rep.lastrow.after"
            
            #end add-point :rep.lastrow.after
END REPORT
 
{</section>}
 
{<section id="astr540_g03.subrep_str" readonly="Y" >}
#讀取子報表樣板
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT astr540_g03_subrep01(sr2)
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
PRIVATE REPORT astr540_g03_subrep02(sr2)
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
PRIVATE REPORT astr540_g03_subrep03(sr2)
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
PRIVATE REPORT astr540_g03_subrep04(sr2)
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
 
{<section id="astr540_g03.other_function" readonly="Y" >}

 
{</section>}
 
{<section id="astr540_g03.other_report" readonly="Y" >}

 
{</section>}
 
