#該程式未解開Section, 採用最新樣板產出!
{<section id="asrr002_x01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:1(2015-03-02 16:26:48), PR版次:0001(2015-03-18 10:56:50)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000060
#+ Filename...: asrr002_x01
#+ Description: ...
#+ Creator....: 05423(2014-12-22 14:42:41)
#+ Modifier...: 05423 -SD/PR- 05423
 
{</section>}
 
{<section id="asrr002_x01.global" readonly="Y" >}
#報表 x01 樣板自動產生(Version:8)
#add-point:填寫註解說明 name="global.memo"

#end add-point
#add-point:填寫註解說明 name="global.memo_customerization"

#end add-point
 
IMPORT os
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_report.inc"                  #報表使用的global
 
#報表 type 宣告
DEFINE tm RECORD
       wc STRING                   #where condition
       END RECORD
 
DEFINE g_str           STRING,                      #列印條件回傳值              
       g_sql           STRING  
 
#add-point:自定義環境變數(Global Variable)(客製用) name="global.variable_customerization"

#end add-point
#add-point:自定義環境變數(Global Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="asrr002_x01.main" readonly="Y" >}
PUBLIC FUNCTION asrr002_x01(p_arg1)
DEFINE  p_arg1 STRING                  #tm.wc  where condition
#add-point:init段define(客製用) name="component.define_customerization"

#end add-point
#add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="component.define"

#end add-point
 
   LET tm.wc = p_arg1
 
   #add-point:報表元件參數準備 name="component.arg.prep"
   
   #end add-point
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   ##報表元件執行期間是否有錯誤代碼
   LET g_rep_success = 'Y'
   
   #報表元件代號      
   LET g_rep_code = "asrr002_x01"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #create 暫存檔
   CALL asrr002_x01_create_tmptable()
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF
   #報表select欄位準備
   CALL asrr002_x01_sel_prep()
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
   #報表insert的prepare
   CALL asrr002_x01_ins_prep()  
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF
   #將資料存入tmptable
   CALL asrr002_x01_ins_data() 
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
   #將tmptable資料印出
   CALL asrr002_x01_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="asrr002_x01.create_tmptable" readonly="Y" >}
PRIVATE FUNCTION asrr002_x01_create_tmptable()
 
   #清除temptable 陣列
   CALL g_rep_tmpname.clear()
   
   #可切換資料庫，避免大量資料佔資源及空間
   #add-point:create_tmp.before name="create_tmp.before"
   
   #end add-point:create_tmp.before
 
   #主報表TEMP TABLE的欄位SQL   
   LET g_sql = "sffb009.sffb_t.sffb009,ecaa_t_ecaa002.ecaa_t.ecaa002,l_year.type_t.chr30,l_month.type_t.chr30,sffbdocdt.sffb_t.sffbdocdt,l_sffb014.type_t.num15_3,l_sfnb005.type_t.num15_3,ecaa_t_ecaa007.ecaa_t.ecaa007,l_pct.type_t.num20_6" 
   
   #建立TEMP TABLE,主報表序號1 
   IF NOT cl_xg_create_tmptable(g_sql,1) THEN
      LET g_rep_success = 'N'            
   END IF
   #可切換資料庫，避免大量資料佔資源及空間
   #add-point:create_tmp.after name="create_tmp.after"
   
   #end add-point:create_tmp.after
END FUNCTION
 
{</section>}
 
{<section id="asrr002_x01.ins_prep" readonly="Y" >}
PRIVATE FUNCTION asrr002_x01_ins_prep()
DEFINE i              INTEGER
DEFINE l_prep_str     STRING
#add-point:ins_prep.define (客製用) name="ins_prep.define_customerization"

#end add-point:ins_prep.define
#add-point:ins_prep.define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_prep.define"

#end add-point:ins_prep.define
 
   FOR i = 1 TO g_rep_tmpname.getLength()
      CALL cl_xg_del_data(g_rep_tmpname[i])
      #LET g_sql = g_rep_ins_prep[i]              #透過此lib取得prepare字串 lib精簡
      CASE i
         WHEN 1
         #INSERT INTO PREP
         LET g_sql = " INSERT INTO ",g_rep_db CLIPPED,g_rep_tmpname[1] CLIPPED," VALUES(?,?,?,?,?,?, 
             ?,?,?)"
         PREPARE insert_prep FROM g_sql
         IF STATUS THEN
            LET l_prep_str ="insert_prep",i
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_prep_str
            LET g_errparam.code   = status
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            CALL cl_xg_drop_tmptable()
            LET g_rep_success = 'N'           
         END IF 
         #add-point:insert_prep段 name="insert_prep"
         
         #end add-point                  
 
 
      END CASE
   END FOR
END FUNCTION
 
{</section>}
 
{<section id="asrr002_x01.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asrr002_x01_sel_prep()
DEFINE g_select      STRING
DEFINE g_from        STRING
DEFINE g_where       STRING
#add-point:sel_prep段define(客製用) name="sel_prep.define_customerization"

#end add-point
#add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
DEFINE l_sql         STRING
#end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
 
   #add-point:sel_prep g_select name="sel_prep.g_select"
   LET g_select = " SELECT DISTINCT sffb009,ecaa_t.ecaa002,NULL,NULL,sffbdocdt,NULL,NULL,COALESCE(ecaa_t.ecaa007,0),NULL"

#   #end add-point
#   LET g_select = " SELECT sffb009,ecaa_t.ecaa002,NULL,NULL,sffbdocdt,NULL,NULL,ecaa_t.ecaa007,NULL"
# 
#   #add-point:sel_prep g_from name="sel_prep.g_from"
    LET g_from = " FROM sffb_t ",
                 " LEFT OUTER JOIN sfnb_t ON sffbdocno = sfnbdocno AND sffbent = sfnbent AND sffbsite = sfnbsite ",
                 " LEFT OUTER JOIN sfnc_t ON sfncent = sfnbent AND sfncsite = sfnbsite AND sfncdocno = sfnbdocno AND sfncseq = sfnbseq ",
                 " LEFT OUTER JOIN ecaa_t ON sffb009 = ecaa001 AND sffbent = ecaaent AND sffbsite = ecaasite "

#   #end add-point
#    LET g_from = " FROM sffb_t,sfnb_t,ecaa_t"
# 
#   #add-point:sel_prep g_where name="sel_prep.g_where"
   
   #end add-point
    LET g_where = " WHERE " ,tm.wc CLIPPED
 
   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("sffb_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   LET l_sql = " UNION ",
   " (SELECT DISTINCT sfnc000,ecaa_t.ecaa002,NULL,NULL,sfnadocdt,NULL,NULL,COALESCE(ecaa_t.ecaa007,0),NULL ",
   " FROM sfnb_t LEFT OUTER JOIN sfna_t ON sfnbdocno = sfnadocno AND sfnbent = sfnaent AND sfnbsite = sfnasite ",
   " LEFT OUTER JOIN sfnc_t ON sfncdocno = sfnbdocno AND sfncent = sfnbent AND sfncsite = sfnbsite AND sfncseq = sfnbseq ",
   " LEFT OUTER JOIN ecaa_t ON sfnc000 = ecaa001 AND sfncent = ecaaent AND sfncsite = ecaasite ",
   " LEFT OUTER JOIN sffb_t ON sffb009 = sfnc000 AND sffbent = sfncent AND sffbsite = sfncsite ",
   " WHERE ",tm.wc CLIPPED ," )",
   " ORDER BY sffbdocdt "
   
   LET g_sql = g_sql CLIPPED ," ",l_sql CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段
   #end add-point
   PREPARE asrr002_x01_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET g_rep_success = 'N' 
   END IF
   DECLARE asrr002_x01_curs CURSOR FOR asrr002_x01_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="asrr002_x01.ins_data" readonly="Y" >}
PRIVATE FUNCTION asrr002_x01_ins_data()
DEFINE sr RECORD 
   sffb009 LIKE sffb_t.sffb009, 
   ecaa_t_ecaa002 LIKE ecaa_t.ecaa002, 
   l_year LIKE type_t.chr30, 
   l_month LIKE type_t.chr30, 
   sffbdocdt LIKE sffb_t.sffbdocdt, 
   l_sffb014 LIKE type_t.num15_3, 
   l_sfnb005 LIKE type_t.num15_3, 
   ecaa_t_ecaa007 LIKE ecaa_t.ecaa007, 
   l_pct LIKE type_t.num20_6
 END RECORD
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"

#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    
    #end add-point
 
    LET g_rep_success = 'Y'
 
    FOREACH asrr002_x01_curs INTO sr.*                               
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
       IF NOT cl_null(sr.sffbdocdt) THEN
         LET sr.l_year = YEAR(sr.sffbdocdt)
         LET sr.l_month = MONTH(sr.sffbdocdt)
       END IF
       #報工工時（分）：依工作站、生產日期取SUM(sffb014)
       SELECT SUM(sffb014) INTO sr.l_sffb014
         FROM sffb_t
        WHERE sffb009 = sr.sffb009
          AND sffbdocdt = sr.sffbdocdt
          AND sffbent = g_enterprise
          AND sffbsite = g_site
       IF cl_null(sr.l_sffb014) THEN
          LET sr.l_sffb014 = 0
       END IF
       #異常工時（分）：asft700中SUM(sfnb005)
       #過濾條件 sfnastus='Y' and sfnadocdt = '當前行生產日期' and sfnc000 = '當前行工作站' and sfnb011 = ‘0‘
       SELECT SUM(sfnb005) INTO sr.l_sfnb005
         FROM sfnb_t LEFT OUTER JOIN sfna_t ON sfnbent = sfnaent AND sfnbdocno = sfnadocno
                     LEFT OUTER JOIN sfnc_t ON sfncent = sfnbent AND sfncsite = sfnbsite AND sfncdocno = sfnbdocno AND sfncseq = sfnbseq
        WHERE sfnastus = 'Y'
          AND sfnadocdt = sr.sffbdocdt
          AND sfnc000 = sr.sffb009
          AND sfnb011 = '0'
          AND sfnbent = g_enterprise
          AND sfnbsite = g_site
       IF cl_null(sr.l_sfnb005) THEN
          LET sr.l_sfnb005 = 0
       END IF
       #稼動率：（報工工時-異常工時）/每日機器產能*60 
       IF NOT cl_null(sr.ecaa_t_ecaa007) OR sr.ecaa_t_ecaa007!= 0 THEN       
         LET sr.l_pct = (sr.l_sffb014 - sr.l_sfnb005 )/ (sr.ecaa_t_ecaa007 * 60)
       ELSE
         LET sr.l_pct = NULL
       END IF
       #end add-point
 
       #add-point:ins_data段before.save name="ins_data.before.save"
       
       #end add-point
 
       #EXECUTE
       EXECUTE insert_prep USING sr.sffb009,sr.ecaa_t_ecaa002,sr.l_year,sr.l_month,sr.sffbdocdt,sr.l_sffb014,sr.l_sfnb005,sr.ecaa_t_ecaa007,sr.l_pct
 
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = "asrr002_x01_execute"
          LET g_errparam.code   = SQLCA.sqlcode
          LET g_errparam.popup  = FALSE
          CALL cl_err()       
          LET g_rep_success = 'N'
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段after_save name="ins_data.after.save"
       
       #end add-point
       
    END FOREACH
    
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="asrr002_x01.rep_data" readonly="Y" >}
PRIVATE FUNCTION asrr002_x01_rep_data()
#add-point:rep_data.define (客製用) name="rep_data.define_customerization"

#end add-point:rep_data.define
#add-point:rep_data.define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="rep_data.define"

#end add-point:rep_data.define
 
    #add-point:rep_data.before name="rep_data.before"
    
    #end add-point:rep_data.before
    
    CALL cl_xg_view()
    #add-point:rep_data.after name="rep_data.after"
    
    #end add-point:rep_data.after
END FUNCTION
 
{</section>}
 
{<section id="asrr002_x01.other_function" readonly="Y" >}

 
{</section>}
 
