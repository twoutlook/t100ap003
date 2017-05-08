#該程式未解開Section, 採用最新樣板產出!
{<section id="astr340_g03.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:1(2016-07-11 12:56:43), PR版次:0001(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000019
#+ Filename...: astr340_g03
#+ Description: ...
#+ Creator....: 06540(2016-06-30 16:22:54)
#+ Modifier...: 06540 -SD/PR- 00000
 
{</section>}
 
{<section id="astr340_g03.global" readonly="Y" >}
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
   stbe016 LIKE stbe_t.stbe016, 
   stbe011 LIKE stbe_t.stbe011, 
   stbe017 LIKE stbe_t.stbe017, 
   stbdsite LIKE stbd_t.stbdsite, 
   stbdent LIKE stbd_t.stbdent, 
   stbd002 LIKE stbd_t.stbd002, 
   stbe032 LIKE stbe_t.stbe032, 
   stbe025 LIKE stbe_t.stbe025, 
   stbe024 LIKE stbe_t.stbe024, 
   stbe012 LIKE stbe_t.stbe012, 
   l_kxname LIKE type_t.chr100, 
   stbe005 LIKE stbe_t.stbe005, 
   stbe019 LIKE stbe_t.stbe019, 
   stbesite LIKE stbe_t.stbesite, 
   stbdcnfid LIKE stbd_t.stbdcnfid, 
   stbddocdt LIKE stbd_t.stbddocdt, 
   stbd038 LIKE stbd_t.stbd038, 
   stbd006 LIKE stbd_t.stbd006, 
   stbd005 LIKE stbd_t.stbd005, 
   stbd026 LIKE stbd_t.stbd026, 
   stbd025 LIKE stbd_t.stbd025, 
   stbd015 LIKE stbd_t.stbd015, 
   stbd033 LIKE stbd_t.stbd033, 
   stbddocno LIKE stbd_t.stbddocno, 
   l_idnum LIKE type_t.chr100, 
   l_jsname LIKE type_t.chr30, 
   l_name LIKE type_t.chr30, 
   l_js LIKE type_t.chr100, 
   l_pmaal003 LIKE type_t.chr100, 
   l_ooefl003 LIKE type_t.chr100
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
 
{<section id="astr340_g03.main" readonly="Y" >}
PUBLIC FUNCTION astr340_g03(p_arg1)
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
   
   LET g_rep_code = "astr340_g03"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #主報表select子句準備
   CALL astr340_g03_sel_prep()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料存入array
   CALL astr340_g03_ins_data()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料印出
   CALL astr340_g03_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="astr340_g03.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astr340_g03_sel_prep()
   #add-point:sel_prep段define (客製用) name="sel_prep.define_customerization"
   
   #end add-point
   #add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
   
   #end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
   
   #add-point:sel_prep g_select name="sel_prep.g_select"
   
   #end add-point
   LET g_select = " SELECT stbe016,stbe011,stbe017,stbdsite,stbdent,stbd002,stbe032,stbe025,stbe024, 
       stbe012,NULL,stbe005,stbe019,stbesite,stbdcnfid,stbddocdt,stbd038,stbd006,stbd005,stbd026,stbd025, 
       stbd015,stbd033,stbddocno,NULL,NULL,NULL,NULL,NULL,NULL"
 
   #add-point:sel_prep g_from name="sel_prep.g_from"
   
   #end add-point
    LET g_from = " FROM stbd_t,stbe_t"
 
   #add-point:sel_prep g_where name="sel_prep.g_where"
   
    LET g_where = " WHERE stbd000 = '1' AND stbdent =stbeent and stbddocno = stbedocno and stbe001='3' and stbe024='N' and " ,tm.wc CLIPPED     
    
#   #end add-point
#    LET g_where = " WHERE " ,tm.wc CLIPPED 
# 
#   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
    LET g_order = " ORDER BY stbddocno,stbesite,stbe005"
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("stbd_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED ," ",g_order CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段 
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE astr340_g03_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET g_rep_success = 'N'    
   END IF
   DECLARE astr340_g03_curs CURSOR FOR astr340_g03_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="astr340_g03.ins_data" readonly="Y" >}
PRIVATE FUNCTION astr340_g03_ins_data()
#主報表record(用於select子句)
   DEFINE sr_s RECORD 
   stbe016 LIKE stbe_t.stbe016, 
   stbe011 LIKE stbe_t.stbe011, 
   stbe017 LIKE stbe_t.stbe017, 
   stbdsite LIKE stbd_t.stbdsite, 
   stbdent LIKE stbd_t.stbdent, 
   stbd002 LIKE stbd_t.stbd002, 
   stbe032 LIKE stbe_t.stbe032, 
   stbe025 LIKE stbe_t.stbe025, 
   stbe024 LIKE stbe_t.stbe024, 
   stbe012 LIKE stbe_t.stbe012, 
   l_kxname LIKE type_t.chr100, 
   stbe005 LIKE stbe_t.stbe005, 
   stbe019 LIKE stbe_t.stbe019, 
   stbesite LIKE stbe_t.stbesite, 
   stbdcnfid LIKE stbd_t.stbdcnfid, 
   stbddocdt LIKE stbd_t.stbddocdt, 
   stbd038 LIKE stbd_t.stbd038, 
   stbd006 LIKE stbd_t.stbd006, 
   stbd005 LIKE stbd_t.stbd005, 
   stbd026 LIKE stbd_t.stbd026, 
   stbd025 LIKE stbd_t.stbd025, 
   stbd015 LIKE stbd_t.stbd015, 
   stbd033 LIKE stbd_t.stbd033, 
   stbddocno LIKE stbd_t.stbddocno, 
   l_idnum LIKE type_t.chr100, 
   l_jsname LIKE type_t.chr30, 
   l_name LIKE type_t.chr30, 
   l_js LIKE type_t.chr100, 
   l_pmaal003 LIKE type_t.chr100, 
   l_ooefl003 LIKE type_t.chr100
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
    FOREACH astr340_g03_curs INTO sr_s.*
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
      SELECT staal003 INTO sr_s.l_js 
        FROM staal_t WHERE staal001=sr_s.stbe017 AND staalent=sr_s.stbdent AND staal002=g_dlang 
      LET sr_s.l_js = sr_s.stbe017,'|',sr_s.l_js   
      LET sr_s.stbe012 =sr_s.stbe012*sr_s.stbe011
      SELECT stael003 INTO sr_s.l_name  FROM stael_t WHERE stael001=sr_s.stbe005 AND staelent=sr_s.stbdent
      SELECT pmaal003 INTO sr_s.l_pmaal003 FROM pmaal_t WHERE pmaal001=sr_s.stbd002 AND pmaalent=sr_s.stbdent AND pmaal002=g_dlang  
      LET sr_s.l_pmaal003=sr_s.stbd002,' ',sr_s.l_pmaal003 

      #店组取法人名称 
      SELECT ooefl006 INTO sr_s.l_ooefl003 
        FROM ooef_t,ooefl_t 
       WHERE ooef001=sr_s.stbdsite 
         AND ooefent =sr_s.stbdent
         AND ooefl002 = g_dlang
         AND ooefl001 = ooef017  
       #end add-point
 
       #add-point:ins_data段before_arr name="ins_data.before.save"
       
       #end add-point
 
       #set rep array value
       LET sr[l_cnt].stbe016 = sr_s.stbe016
       LET sr[l_cnt].stbe011 = sr_s.stbe011
       LET sr[l_cnt].stbe017 = sr_s.stbe017
       LET sr[l_cnt].stbdsite = sr_s.stbdsite
       LET sr[l_cnt].stbdent = sr_s.stbdent
       LET sr[l_cnt].stbd002 = sr_s.stbd002
       LET sr[l_cnt].stbe032 = sr_s.stbe032
       LET sr[l_cnt].stbe025 = sr_s.stbe025
       LET sr[l_cnt].stbe024 = sr_s.stbe024
       LET sr[l_cnt].stbe012 = sr_s.stbe012
       LET sr[l_cnt].l_kxname = sr_s.l_kxname
       LET sr[l_cnt].stbe005 = sr_s.stbe005
       LET sr[l_cnt].stbe019 = sr_s.stbe019
       LET sr[l_cnt].stbesite = sr_s.stbesite
       LET sr[l_cnt].stbdcnfid = sr_s.stbdcnfid
       LET sr[l_cnt].stbddocdt = sr_s.stbddocdt
       LET sr[l_cnt].stbd038 = sr_s.stbd038
       LET sr[l_cnt].stbd006 = sr_s.stbd006
       LET sr[l_cnt].stbd005 = sr_s.stbd005
       LET sr[l_cnt].stbd026 = sr_s.stbd026
       LET sr[l_cnt].stbd025 = sr_s.stbd025
       LET sr[l_cnt].stbd015 = sr_s.stbd015
       LET sr[l_cnt].stbd033 = sr_s.stbd033
       LET sr[l_cnt].stbddocno = sr_s.stbddocno
       LET sr[l_cnt].l_idnum = sr_s.l_idnum
       LET sr[l_cnt].l_jsname = sr_s.l_jsname
       LET sr[l_cnt].l_name = sr_s.l_name
       LET sr[l_cnt].l_js = sr_s.l_js
       LET sr[l_cnt].l_pmaal003 = sr_s.l_pmaal003
       LET sr[l_cnt].l_ooefl003 = sr_s.l_ooefl003
 
 
       #add-point:ins_data段after_arr name="ins_data.after.save"
       
       #end add-point
       LET l_cnt = l_cnt + 1
    END FOREACH
    CALL sr.deleteElement(l_cnt)
 
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astr340_g03.rep_data" readonly="Y" >}
PRIVATE FUNCTION astr340_g03_rep_data()
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
          START REPORT astr340_g03_rep TO XML HANDLER handler
          FOR l_i = 1 TO sr.getLength()
             OUTPUT TO REPORT astr340_g03_rep(sr[l_i].*)
             #報表中斷列印時，顯示錯誤訊息
             IF fgl_report_getErrorStatus() THEN
                DISPLAY "FGL: STOPPING REPORT msg=\"",fgl_report_getErrorString(),"\""
                EXIT FOR
             END IF                  
          END FOR
          FINISH REPORT astr340_g03_rep
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
 
{<section id="astr340_g03.rep" readonly="Y" >}
PRIVATE REPORT astr340_g03_rep(sr1)
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
DEFINE l_rep05_sum    LIKE pmdt_t.pmdt036
DEFINE  s1    LIKE pmdt_t.pmdt036
DEFINE  s2    LIKE pmdt_t.pmdt036
DEFINE  s3    LIKE pmdt_t.pmdt036
DEFINE  s4    LIKE pmdt_t.pmdt036
DEFINE  s5    LIKE pmdt_t.pmdt036
DEFINE  s6    varchar(20)
DEFINE  l_amount  varchar(10)
DEFINE l_ooefl006  LIKE ooefl_t.ooefl006
DEFINE l_stbd046   LIKE stbd_t.stbd046
DEFINE l_stbd001   LIKE stbd_t.stbd001
DEFINE l_stbd046_desc LIKE type_t.chr50
DEFINE l_stan017   LIKE stan_t.stan017 
DEFINE l_stan018   LIKE stan_t.stan018  

#end add-point
 
    #add-point:rep段ORDER_before name="rep.order.before"
    
    #end add-point
    ORDER EXTERNAL BY sr1.stbddocno,sr1.stbesite,sr1.stbe005
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
            SELECT ooefl006 INTO l_ooefl006
             FROM ooefl_t 
             WHERE ooeflent = sr1.stbdent
               AND ooefl001 = (SELECT ooef017 
                                 FROM ooef_t 
                                WHERE ooefent = sr1.stbdent AND ooef001 = sr1.stbdsite) 
               AND ooefl002 = g_dlang
            LET g_grPageHeader.title0101 = l_ooefl006
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
                          
            #end add-point:rep.apr.signstr
            PRINTX g_grSign.*
 
 
 
           #add-point:rep.b_group.stbddocno.before name="rep.b_group.stbddocno.before"
            LET l_rep05_sum =0
            LET s1 =0
            LET s2 =0
            LET s3 =0
            LET s4 =0
            LET s5 =0
            LET s6 =''
            LET l_amount ='零'
            
            #合同编号和付款供应商
            SELECT stbd001,stbd046 INTO l_stbd001,l_stbd046 
              FROM stbd_t 
             WHERE stbdent = sr1.stbdent AND stbddocno=sr1.stbddocno
           
           SELECT pmaal003 INTO l_stbd046_desc FROM pmaal_t 
            WHERE pmaal001=l_stbd046 AND pmaalent=sr1.stbdent AND pmaal002=g_dlang  
           LET l_stbd046_desc=l_stbd046,' ',l_stbd046_desc

           SELECT stan017,stan018 INTO l_stan017,l_stan018 FROM stan_t
            WHERE stanent = g_enterprise AND stan001=l_stbd001
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
           PREPARE astr340_g03_repcur01_cnt_pre FROM l_sub_sql
           EXECUTE astr340_g03_repcur01_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep01_show ="Y"
           END IF
           PRINTX l_subrep01_show
           START REPORT astr340_g03_subrep01
           DECLARE astr340_g03_repcur01 CURSOR FROM g_sql
           FOREACH astr340_g03_repcur01 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr340_g03_repcur01:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub01.foreach name="rep.sub01.foreach"
              
              #end add-point:rep.sub01.foreach
              OUTPUT TO REPORT astr340_g03_subrep01(sr2.*)
           END FOREACH
           FINISH REPORT astr340_g03_subrep01
           #add-point:rep.sub01.after name="rep.sub01.after"
           
           #end add-point:rep.sub01.after
 
 
 
           #add-point:rep.b_group.stbddocno.after name="rep.b_group.stbddocno.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        BEFORE GROUP OF sr1.stbesite
 
           #add-point:rep.b_group.stbesite.before name="rep.b_group.stbesite.before"
           
           #end add-point:
 
 
           #add-point:rep.b_group.stbesite.after name="rep.b_group.stbesite.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        BEFORE GROUP OF sr1.stbe005
 
           #add-point:rep.b_group.stbe005.before name="rep.b_group.stbe005.before"
           
           #end add-point:
 
 
           #add-point:rep.b_group.stbe005.after name="rep.b_group.stbe005.after"
           
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
           PREPARE astr340_g03_repcur02_cnt_pre FROM l_sub_sql
           EXECUTE astr340_g03_repcur02_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep02_show ="Y"
           END IF
           PRINTX l_subrep02_show
           START REPORT astr340_g03_subrep02
           DECLARE astr340_g03_repcur02 CURSOR FROM g_sql
           FOREACH astr340_g03_repcur02 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr340_g03_repcur02:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub02.foreach name="rep.sub02.foreach"
              
              #end add-point:rep.sub02.foreach
              OUTPUT TO REPORT astr340_g03_subrep02(sr2.*)
           END FOREACH
           FINISH REPORT astr340_g03_subrep02
           #add-point:rep.sub02.after name="rep.sub02.after"
           
           #end add-point:rep.sub02.after
 
 
 
          #add-point:rep.everyrow.beforerow name="rep.everyrow.beforerow"
          
          #end add-point:rep.everyrow.beforerow
            
          PRINTX sr1.*
 
          #add-point:rep.everyrow.afterrow name="rep.everyrow.afterrow"
          LET l_rep05_sum = l_rep05_sum + sr1.stbe016
          PRINTX s1
          PRINTX s2
          PRINTX s3
          PRINTX s4
          PRINTX s5
          PRINTX s6
          PRINTX l_amount
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
           PREPARE astr340_g03_repcur03_cnt_pre FROM l_sub_sql
           EXECUTE astr340_g03_repcur03_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep03_show ="Y"
           END IF
           PRINTX l_subrep03_show
           START REPORT astr340_g03_subrep03
           DECLARE astr340_g03_repcur03 CURSOR FROM g_sql
           FOREACH astr340_g03_repcur03 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr340_g03_repcur03:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub03.foreach name="rep.sub03.foreach"
              
              #end add-point:rep.sub03.foreach
              OUTPUT TO REPORT astr340_g03_subrep03(sr2.*)
           END FOREACH
           FINISH REPORT astr340_g03_subrep03
           #add-point:rep.sub03.after name="rep.sub03.after"
           
           #end add-point:rep.sub03.after
 
 
 
          #add-point:rep.everyrow.after name="rep.everyrow.after"
          
          #end add-point:rep.everyrow.after        
 
          #讀取afterGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.stbddocno
 
           #add-point:rep.a_group.stbddocno.before name="rep.a_group.stbddocno.before"
            PRINTX l_rep05_sum
            PRINTX l_stbd001 
            PRINTX l_stbd046
            PRINTX l_stbd046_desc
            PRINTX l_stan017   
            PRINTX l_stan018   
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
           PREPARE astr340_g03_repcur04_cnt_pre FROM l_sub_sql
           EXECUTE astr340_g03_repcur04_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep04_show ="Y"
           END IF
           PRINTX l_subrep04_show
           START REPORT astr340_g03_subrep04
           DECLARE astr340_g03_repcur04 CURSOR FROM g_sql
           FOREACH astr340_g03_repcur04 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "astr340_g03_repcur04:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub04.foreach name="rep.sub04.foreach"
              
              #end add-point:rep.sub04.foreach
              OUTPUT TO REPORT astr340_g03_subrep04(sr2.*)
           END FOREACH
           FINISH REPORT astr340_g03_subrep04
           #add-point:rep.sub04.after name="rep.sub04.after"
           
           #end add-point:rep.sub04.after
 
 
 
           #add-point:rep.a_group.stbddocno.after name="rep.a_group.stbddocno.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.stbesite
 
           #add-point:rep.a_group.stbesite.before name="rep.a_group.stbesite.before"
           
           #end add-point:
 
 
           #add-point:rep.a_group.stbesite.after name="rep.a_group.stbesite.after"
           
           #end add-point:
 
 
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.stbe005
 
           #add-point:rep.a_group.stbe005.before name="rep.a_group.stbe005.before"
           
           #end add-point:
 
 
           #add-point:rep.a_group.stbe005.after name="rep.a_group.stbe005.after"
           
           #end add-point:
 
 
 
       ON LAST ROW
            #add-point:rep.lastrow.before name="rep.lastrow.before"  
                    
            #end add-point :rep.lastrow.before
 
            #add-point:rep.lastrow.after name="rep.lastrow.after"
            
            #end add-point :rep.lastrow.after
END REPORT
 
{</section>}
 
{<section id="astr340_g03.subrep_str" readonly="Y" >}
#讀取子報表樣板
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT astr340_g03_subrep01(sr2)
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
PRIVATE REPORT astr340_g03_subrep02(sr2)
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
PRIVATE REPORT astr340_g03_subrep03(sr2)
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
PRIVATE REPORT astr340_g03_subrep04(sr2)
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
 
{<section id="astr340_g03.other_function" readonly="Y" >}

 
{</section>}
 
{<section id="astr340_g03.other_report" readonly="Y" >}

 
{</section>}
 
